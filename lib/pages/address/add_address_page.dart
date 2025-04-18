
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/address_controller.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends StateX<AddAddressPage> {

  _AddAddressPageState() : super(controller: AddressController(), useInherited: true) {
    con = controller as AddressController;
  }
  late AddressController con;

  late GoogleMapController mapController;
  late LatLng _initialPosition = LatLng(10.8027117, 78.2978937);
  LatLng _selectedPosition = LatLng(10.8027117, 78.2978937);
  String _address = '';


  final apiKey = 'AIzaSyBRxE8E6WSJaIzLPx7zpGHEbo5djXx3bTY'; // Replace with your API key
  // final _geocoding = GoogleMapsGeocoding(apiKey: 'AIzaSyAllf0gGdRTTog1ChI62srhdNZ-hVsEYe0'); // Replace with your API key

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTapped(LatLng position) async {
    setState(() {
      _selectedPosition = position;
      con.getZone(context, position.latitude.toString(), position.longitude.toString());
    });
    try {
      // Get the address using the geocoding package
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // If the placemark is found, update the address
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _address = "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _selectedPosition = _initialPosition;
      con.getZone(context, position.latitude.toString(), position.longitude.toString());
    });

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
      ),
    );

    try {
      // Get the address using the geocoding package
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // If the placemark is found, update the address
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _address = "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _showBottomSheet(BuildContext context) {

    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var addressType = "Select";

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Padding for keyboard
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text(
                      'Recipient Details',
                      style: AppStyle.fontSarabunBold.override(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                        onChanged: (e){
                          con.addressRequest.landmark = e;
                        },
                        decoration: InputDecoration(
                            hintText: 'Flat no / Street / Landmark',
                            border: InputBorder.none,
                            hintStyle: AppStyle.fontSarabunRegular.override(fontSize: 14,color: AppColors.hintTextColor),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15)
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                        onChanged: (e){
                          con.addressRequest.mobileNumber = e;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: AppStyle.fontSarabunRegular.override(fontSize: 14,color: AppColors.hintTextColor),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: DropdownButtonFormField<String>(
                          value: addressType,
                          decoration: InputDecoration(
                              hintText: 'Address Type',
                              hintStyle: AppStyle.fontSarabunRegular.override(fontSize: 14,color: AppColors.hintTextColor),
                              border: InputBorder.none
                          ),
                          items: <String>["Select",'Home', 'Office'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              addressType = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: (){
                          con.addressRequest.address = _address;
                          con.addressRequest.type = addressType;
                          con.addressRequest.latMap = _selectedPosition.latitude.toString();
                          con.addressRequest.longMap = _selectedPosition.longitude.toString();
                          con.addressRequest.houseno = "";
                          con.addressRequest.pincode = "";
                          con.addAddress(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.themeColor, // Gray fill color
                          borderRadius: BorderRadius.circular(15.0), // Rounded corners
                        ),
                        child: Center(
                          child:   Text("Process",style: AppStyle.fontSarabunMedium.override(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set your desired back button color
        ),
        title: Text(
          "Add Address",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition,
                      zoom: 12.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('selected-location'),
                        position: _selectedPosition,
                      ),
                    },
                    onTap: _onMapTapped,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Address:',
                        style: AppStyle.fontSarabunBold,
                      ),
                      SizedBox(height: 8.0),
                      Text(_address,style: AppStyle.fontSarabunMedium,),
                      SizedBox(height: 8.0),
                      if(con.isServiceAvailable)
                      InkWell(
                        onTap: (){
                          _showBottomSheet(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.themeColor, // Gray fill color
                            borderRadius: BorderRadius.circular(15.0), // Rounded corners
                          ),
                          child: Center(
                            child:   Text("Process",style: AppStyle.fontSarabunMedium.override(color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
