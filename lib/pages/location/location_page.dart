


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/controller/location_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../utils/preference_utils.dart';

class LocationPage extends StatefulWidget {

  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends StateX<LocationPage>{

  _LocationPageState() : super(controller: LocationController(), useInherited: true) {
    con = controller as LocationController;
  }
  late LocationController con;


  String _currentLocation = "Fetching location...";
  bool isIosLocationPermission = false;
  bool isBottomDialog = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkAndRequestLocationAndroidPermission(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  Future<void> _checkAndRequestLocationAndroidPermission(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show an error.
      _showModalBottomSheet(context);
      //await Geolocator.requestPermission();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied.
        _showModalBottomSheet(context);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, open app settings.
      bool opened = await openAppSettings();
      if (!opened) {
        // Show an error if opening settings fails.
        _showModalBottomSheet(context);
      }
      return;
    }

    // Permissions are granted, get the current position.
    _determinePosition();
  }



  void _showModalBottomSheet(BuildContext context) {
    isBottomDialog = true;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.location_off_outlined,color: Colors.red,size: 40,),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Device location not enabled",style: AppStyle.fontSarabunMedium.override(color: Colors.black,fontSize: 12),),
                      Text("Ensure your device location for a better delivery",style: AppStyle.fontSarabunMedium.override(color: Colors.black,fontSize: 8),),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: () async {
                           checkLocationServices();
                        },
                        child: Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.themeColor, // Gray fill color
                            borderRadius: BorderRadius.circular(15.0), // Rounded corners
                          ),
                          child: Center(
                            child:   Text("Enable",style: AppStyle.fontSarabunMedium.override(color: Colors.white,fontSize: 12)),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }



  void checkLocationServices() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      context.go('/');
      // Recheck after user returns from location settings
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        setState(() {

        }); // Update UI after enabling location services
      }
    }
  }



  Future<void> _determinePosition() async {
    LocationPermission permission;
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = "Location services are disabled.";
      });
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      //_currentLocation = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      PreferenceUtils.saveLatitude(position.latitude.toString());
      PreferenceUtils.saveLongitude(position.longitude.toString());
      isIosLocationPermission = true;
      _getAddressFromLatLng(position);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        position!.latitude, position!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentLocation =
        '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
      });
      con.getZone(context, position.latitude.toString(), position.longitude.toString());
      PreferenceUtils.saveLatitude(position.latitude.toString());
      PreferenceUtils.saveLatitude(position.longitude.toString());
      PreferenceUtils.saveLocation(_currentLocation);
    }).catchError((e) {
      debugPrint(e);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://lottie.host/5630cc81-3a1b-4ede-8e1f-4d5abc2e5416/3oD89iPV33.json',height: 100,width: 100),
                  SizedBox(height: 10,),
                  Text(_currentLocation,style: AppStyle.fontSarabunBold.override(color: Colors.blue)),
                  SizedBox(height: 20,),

                ])));
     }

}