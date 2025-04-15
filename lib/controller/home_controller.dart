


import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/response/home/all_category_response.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/login/login_response.dart';
import 'package:userapp/model/response/product/product_response.dart';
import 'package:userapp/model/response/product/sub_category_response.dart';
import 'package:userapp/utils/validation_utils.dart';

import '../network/api_service.dart';
import '../utils/loader.dart';
import '../utils/preference_utils.dart';

class HomeController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();

  String? address = "";
  String? lat;
  String? lng;
  String? userId;
  String? userName = "";
  String? deviceToken = "";
  var profileResponse = LoginResponse();
  var homeDataResponse = HomeDataResponse();
  var allCategoryResponse = AllCategoryResponse();
  List<SubCategoryData> subCategoryList = [];
  List<ProductData> productList = [];

  getDataInformation(BuildContext context)  async {
    address = await PreferenceUtils.getLocation();
    print(address);
    lat = await PreferenceUtils.getLatitude();
    lng = await PreferenceUtils.getLongitude();
    userId = await PreferenceUtils.getUserId();
    getProfile(context);
    getHomeData(context);
    notifyClients();
  }

  getProfile(BuildContext context){
    Loader.show();
    apiService.getProfile().then((value){
      Loader.hide();
        profileResponse = value;
        userName = profileResponse.data!.name!;
        notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getHomeData(BuildContext context){
    Loader.show();
    apiService.getHomeData(lat!,lng!).then((value){
      Loader.hide();
      homeDataResponse = value;
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getSubCategory(BuildContext context,String catId){
    Loader.show();
    apiService.getSubCategory(catId).then((value){
      Loader.hide();
      if(value.success!) {
        subCategoryList = value.subCategoryData!;
      }else{
        ValidationUtils.showAppToast("No category found");
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getProduct(BuildContext context,String catId,String subId){
    Loader.show();
    apiService.getProduct(catId,subId).then((value){
      Loader.hide();
      if(value.success!) {
        productList = value.productData!;
      }else{
        ValidationUtils.showAppToast("No category found");
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getAllCategory(BuildContext context){
    Loader.show();
    apiService.getAllCategory().then((value){
      Loader.hide();
      if(value.success!) {
        allCategoryResponse = value;
      }else{
        ValidationUtils.showAppToast("No category found");
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

}