


import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/request/order/order_request.dart';
import 'package:userapp/model/response/home/all_category_response.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/login/login_response.dart';
import 'package:userapp/model/response/notifications/notification_response.dart';
import 'package:userapp/model/response/product/product_offer_response.dart';
import 'package:userapp/model/response/product/product_response.dart';
import 'package:userapp/model/response/product/sub_category_response.dart';
import 'package:userapp/utils/validation_utils.dart';

import '../model/response/order/order_response.dart';
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
  var orderRequest = OrderRequest();
  List<SubCategoryData> subCategoryList = [];
  List<NotificationData> notificationsList = [];
  List<ProductOffersData> productOfferList = [];
  List<OverallOrderDetails> orderList = [];
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

  getNotifications(BuildContext context){
    Loader.show();
    apiService.getNotifications().then((value){
      Loader.hide();
      if(value.success!) {
        notificationsList = value.notificationData!;
      }else{
        ValidationUtils.showAppToast("No category found");
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getProductsOffers(BuildContext context,String productId){
    Loader.show();
    apiService.getProductOffers(productId).then((value){
      Loader.hide();
      if(value.success!) {
        productOfferList = value.productoffersData!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  createOrder(BuildContext context){
    Loader.show();
    apiService.createOrder(orderRequest).then((value){
      Loader.hide();
      if(value.success!) {
        context.pushNamed('product-success-page');
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getMyOrders(BuildContext context){
    Loader.show();
    apiService.getMyOrders().then((value){
      Loader.hide();
      if(value.success!) {
        orderList = value.overallorderdetails!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

}