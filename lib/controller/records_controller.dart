


import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/response/common/common_response.dart';
import 'package:userapp/model/response/packages/amc_packages_response.dart';
import 'package:userapp/model/response/product/amc_products_response.dart';
import 'package:userapp/model/response/records/records_data_response.dart';
import 'package:userapp/utils/validation_utils.dart';

import '../network/api_service.dart';
import '../utils/loader.dart';

class RecordsController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();
  List<RecordsData> recordsList = [];
  List<AmcProductData> amcProductList = [];
  List<AmcPackageData> amcPackagesList = [];
  var recordsRequest = RecordsData();
  var commonResponse = CommonResponse();

  getRecords(BuildContext context) async {
    Loader.show();
    await apiService.getRecords().then((value){
      Loader.hide();
      if(value.success!){
        recordsList = value.recordsData!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  addRecords(BuildContext context, String? selectedType, AmcProductData? amcProduct) async {
    Loader.show();
    serviceKey.currentState!.save();
    recordsRequest.datajson = "";
    recordsRequest.image = "";
    if(amcProduct!=null){
      recordsRequest.amcProductId = amcProduct.id!;
    }else{
      recordsRequest.amcProductId = "2";
    }
    await apiService.addRecords(recordsRequest).then((value){
      Loader.hide();
      if(value.success!){
        commonResponse = value;
        ValidationUtils.showAppToast("Saved successfully");
        context.pop();
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  deleteRecords(BuildContext context,String recordId) async {
    Loader.show();
    await apiService.deleteRecords(recordId).then((value){
      Loader.hide();
      if(value.success!){
        commonResponse = value;
      }
      getRecords(context);
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getAmcProducts(BuildContext context) async {
    Loader.show();
    await apiService.getAmcProducts().then((value){
      Loader.hide();
      if(value.success!){
        amcProductList = value.amcproductData!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }

  getAmcPackages(BuildContext context,String amcProductId) async {
    Loader.show();
    await apiService.getAmcPackages(amcProductId).then((value){
      Loader.hide();
      if(value.success!){
        amcPackagesList = value.amcpackageData!;
      }
      notifyClients();
    }).catchError((e){
      Loader.hide();
      print(e.toString());
    });
  }


}