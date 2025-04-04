


import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';

import '../network/api_service.dart';
import '../utils/loader.dart';

class LocationController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();

  getZone(BuildContext context,String lat,String lng){
    Loader.show();
    apiService.getZone(lat, lng).then((value){
      Loader.hide();
      context.go('/dashboard-page');
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

}