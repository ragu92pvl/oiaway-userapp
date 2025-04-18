



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/request/address/add_address_request.dart';
import 'package:userapp/model/response/address/address_response.dart';

import '../network/api_service.dart';
import '../utils/loader.dart';
import '../utils/preference_utils.dart';

class AddressController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();

  List<AddressData> addressList = [];
  bool isServiceAvailable = false;
  var addressRequest = AddAddressRequest();

  getAddress(BuildContext context){
    Loader.show();
    apiService.getAddress().then((value){
      Loader.hide();
      if(value.success!){
        addressList = value.addressData!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getZone(BuildContext context,String lat,String lng){
    Loader.show();
    apiService.getZone(lat, lng).then((value){
      Loader.hide();
      if(value.data == "no_matched"){
        isServiceAvailable = false;
      }else {
        isServiceAvailable = true;
        PreferenceUtils.saveZoneId(value.data!);
      }
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  addAddress(BuildContext context){
    Loader.show();
    apiService.addAddress(addressRequest).then((value){
      Loader.hide();
      if(value.success!){
        context.pop();
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  deleteAddress(BuildContext context,String addressId){
    Loader.show();
    apiService.deleteAddress(addressId).then((value){
      Loader.hide();
      getAddress(context);
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

}
