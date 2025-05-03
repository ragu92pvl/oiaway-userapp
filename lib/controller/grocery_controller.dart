


import 'package:flutter/cupertino.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/response/cart/cart_model.dart';
import 'package:userapp/model/response/grocery/grocery_data_response.dart';

import '../model/response/grocery/grocery_product_response.dart';
import '../model/response/grocery/grocery_vendor_product_response.dart';
import '../network/api_service.dart';
import '../utils/loader.dart';
import '../utils/preference_utils.dart';

class GroceryController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();
  var groceryDataResponse = GroceryDataResponse();
  List<OverallGroceryProducts> productList = [];
  List<OverallGroceryProducts> cartList = [];
  List<Vendors>? vendorsList = [];
  String? lat;
  String? lng;
  String? cityId;
  int cartCount =0;

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
        if (cartList.isNotEmpty) {
          for (var p in productList) {
            // Count how many times this product appears in cartList
            int count = cartList.where((c) => c.id == p.id).length;
            p.count = count;
          }
        }
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  addToCart(OverallGroceryProducts productData, String type){
    if(type == "add") {
      cartList.add(productData);
    }else if(type == "remove"){
      cartList.remove(productData);
    }
    updateCartCount();
    for (var p in productList) {
        // Count how many times this product appears in cartList
        int count = cartList.where((c) => c.id == p.id).length;
        p.count = count;
    }
    notifyClients();
  }

  updateCartCount(){
    cartCount = cartList.length;
    notifyClients();
  }

  createCart(BuildContext context, Products products){

  }

  getGroceryVendorProducts(List<OverallGroceryProducts> cartList){
    Loader.show();
    apiService.getGroceryVendorProducts(cartList).then((value){
      Loader.hide();
      vendorsList = value.vendors!;
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

}