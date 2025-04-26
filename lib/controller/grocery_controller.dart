


import 'package:flutter/cupertino.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/response/grocery/grocery_data_response.dart';

import '../model/response/grocery/grocery_product_response.dart';
import '../network/api_service.dart';
import '../utils/loader.dart';
import '../utils/preference_utils.dart';

class GroceryController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();
  var groceryDataResponse = GroceryDataResponse();
  List<OverallGroceryProducts> productList = [];
  String? lat;
  String? lng;
  String? cityId;


  getHomeServiceData(BuildContext context) async {
    Loader.show();
    cityId = await PreferenceUtils.getZoneId();
    apiService.getGroceryData(cityId!).then((value){
      Loader.hide();
      groceryDataResponse = value;
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getGroceryProduct(BuildContext context,String catId) async {
    Loader.show();
    apiService.getGroceryProduct(catId!).then((value){
      Loader.hide();
      if(value.success!) {
        productList = value.overallgroceryproducts!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

}