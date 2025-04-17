
import 'package:flutter/cupertino.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/response/service/service_category_response.dart';
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
  List<PackageData> packageList = [];

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

}