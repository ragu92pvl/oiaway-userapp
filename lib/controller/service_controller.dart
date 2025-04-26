
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/request/service/service_request.dart';
import 'package:userapp/model/response/service/my_service_response.dart';
import 'package:userapp/model/response/service/service_category_response.dart';
import 'package:userapp/model/response/service/service_details_response.dart';
import 'package:userapp/model/response/service/service_package_response.dart';
import '../network/api_service.dart';
import '../utils/loader.dart';
import '../utils/preference_utils.dart';

class ServiceController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();
  String? lat;
  String? lng;
  String? cityId;
  var serviceCategoryResponse =  ServiceCategoryResponse();
  var serviceDetailsResponse =  ServiceDetailsResponse();
  var tax = 0.0;
  var discount = 0.0;
  var total = 0.0;
  var grandTotal = 0.0;
  List<PackageData> packageList = [];
  List<MyServiceData> myServiceList = [];
  var serviceRequest = ServiceRequest();

  getHomeServiceData(BuildContext context) async {
    Loader.show();
    cityId = await PreferenceUtils.getZoneId();
    apiService.getHomeServiceData(cityId!).then((value){
      Loader.hide();
      serviceCategoryResponse = value;
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getServicePackages(BuildContext context,String? serviceId) async {
    Loader.show();
    apiService.getServicePackages(serviceId!).then((value){
      Loader.hide();
      if(value.success!){
        packageList = value.packageData!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  createService(BuildContext context) async {
    Loader.show();
    apiService.createService(serviceRequest).then((value){
      Loader.hide();
      if(value.success!){
        context.pushNamed('service-success-page');
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getMyServices(BuildContext context) async {
    Loader.show();
    apiService.getMyServices().then((value){
      Loader.hide();
      if(value.success!){
        myServiceList = value.data!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  serviceDetails(BuildContext context,String serviceId) async {
    Loader.show();
    apiService.serviceDetails(serviceId).then((value){
      Loader.hide();
      if(value.success!){
        serviceDetailsResponse = value;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }


}