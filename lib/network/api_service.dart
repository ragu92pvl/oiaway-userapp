

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/model/request/address/add_address_request.dart';
import 'package:userapp/model/request/order/order_request.dart';
import 'package:userapp/model/request/register/register_request.dart';
import 'package:userapp/model/request/service/service_request.dart';
import 'package:userapp/model/response/address/address_response.dart';
import 'package:userapp/model/response/common/common_response.dart';
import 'package:userapp/model/response/grocery/grocery_data_response.dart';
import 'package:userapp/model/response/home/all_category_response.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/location/zone_response.dart';
import 'package:userapp/model/response/login/login_response.dart';
import 'package:userapp/model/response/notifications/notification_response.dart';
import 'package:userapp/model/response/order/order_response.dart';
import 'package:userapp/model/response/product/product_response.dart';
import 'package:userapp/model/response/product/sub_category_response.dart';
import 'package:userapp/model/response/records/records_data_response.dart';
import 'package:userapp/model/response/register/register_response.dart';
import 'package:userapp/model/response/service/my_service_response.dart';
import 'package:userapp/model/response/service/service_category_response.dart';
import 'package:userapp/model/response/service/service_details_response.dart';
import 'package:userapp/model/response/service/service_package_response.dart';
import '../constants/api_constants.dart';
import '../model/request/login/login_request.dart';
import '../model/response/grocery/grocery_product_response.dart';
import '../model/response/packages/amc_packages_response.dart';
import '../model/response/product/amc_products_response.dart';
import '../model/response/product/product_offer_response.dart';
import '../utils/preference_utils.dart';
import '../utils/time_utils.dart';
import '../utils/validation_utils.dart';
import 'dio_client.dart';

class ApiService {

  final dioClient = DioClient();

  Future<LoginResponse> signIn(LoginRequest signInModel) async {
    try {
      final response = await dioClient.post(
          ApiConstants.login_url, signInModel.toJson());
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await dioClient.post(
          ApiConstants.register, registerRequest.toJson());
      if (response.statusCode == 200) {
        return RegisterResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<ZoneResponse> getZone(String lat,String lng) async {
    try {
      final response = await dioClient.get(
          "${ApiConstants.getZone}/$lat/$lng");
      if (response.statusCode == 200) {
        return ZoneResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<LoginResponse> getProfile() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.profile}/$userId");
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<HomeDataResponse> getHomeData(String lat,String lng) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.homeData}/$lat/$lng/$userId");
      if (response.statusCode == 200) {
        return HomeDataResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<SubCategoryResponse> getSubCategory(String catId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listSubCategory}/$catId");
      if (response.statusCode == 200) {
        return SubCategoryResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<ProductResponse> getProduct(catId,subId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.subCategoryByProduct}/$catId/$subId/$userId");
      if (response.statusCode == 200) {
        return ProductResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<AllCategoryResponse> getAllCategory() async {
    try {
      String? cityId  = await PreferenceUtils.getZoneId();
      final response = await dioClient.get(
          "${ApiConstants.allCategoryService}/$cityId");
      if (response.statusCode == 200) {
        return AllCategoryResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }


  Future<RecordsDataResponse> getRecords() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listRecords}/$userId");
      if (response.statusCode == 200) {
        return RecordsDataResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> addRecords(RecordsData request) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      request.userid = userId;
      final response = await dioClient.post(
          "${ApiConstants.addrecords}",request.toJson());
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> deleteRecords(String recordId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.deleterecords}/$recordId");
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }


  Future<ServiceCategoryResponse> getHomeServiceData(String cityId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.homeServiceData}/$cityId");
      if (response.statusCode == 200) {
        return ServiceCategoryResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<ServicePackageResponse> getServicePackages(String serviceId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listPackages}/$serviceId");
      if (response.statusCode == 200) {
        return ServicePackageResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<AddressResponse> getAddress() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listAddress}/$userId");
      if (response.statusCode == 200) {
        return AddressResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> addAddress(AddAddressRequest addressRequest) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      addressRequest.uid = userId;
      final response = await dioClient.post(
          "${ApiConstants.addAddress}",addressRequest.toJson());
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> deleteAddress(String addressId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.deleteAddress}/$addressId");
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<AmcProductsResponse> getAmcProducts() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listamcproducts}/$userId");
      if (response.statusCode == 200) {
        return AmcProductsResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<AmcPackageResponse> getAmcPackages(amcProductId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listamcpackages}/$amcProductId");
      if (response.statusCode == 200) {
        return AmcPackageResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<NotificationResponse> getNotifications() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.notificationAll}/$userId");
      if (response.statusCode == 200) {
        return NotificationResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> updateAmcProducts(String id,String packageId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.updateamcproduct}/$id/$packageId");
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> createService(ServiceRequest serviceRequest) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      serviceRequest.uid = userId;
      final response = await dioClient.post(
          "${ApiConstants.serviceRequest}",serviceRequest.toJson());
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<MyServiceResponse> getMyServices() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listMyServices}/$userId");
      if (response.statusCode == 200) {
        return MyServiceResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<ServiceDetailsResponse> serviceDetails(String serviceId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.serviceDetails}/$serviceId");
      if (response.statusCode == 200) {
        return ServiceDetailsResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<ProductOfferResponse> getProductOffers(String productId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listproductoffers}/$productId");
      if (response.statusCode == 200) {
        return ProductOfferResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<CommonResponse> createOrder(OrderRequest orderRequest) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      orderRequest.uid = userId;
      final response = await dioClient.post(
          "${ApiConstants.placeproductorder}",orderRequest.toJson());
      if (response.statusCode == 200) {
        return CommonResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<OrderResponse> getMyOrders() async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listproductorders}/$userId");
      if (response.statusCode == 200) {
        return OrderResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<GroceryDataResponse> getGroceryData(String cityId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.groceryData}/$cityId");
      if (response.statusCode == 200) {
        return GroceryDataResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }

  Future<GroceryProductResponse> getGroceryProduct(String catId) async {
    try {
      String? userId  = await PreferenceUtils.getUserId();
      final response = await dioClient.get(
          "${ApiConstants.listgroceryproducts}/$catId");
      if (response.statusCode == 200) {
        return GroceryProductResponse.fromJson(response.data);
      } else {
        ValidationUtils.showAppToast(
            'Failed to sign in. Status code: ${response.statusCode}');
        throw Exception(
            'Failed to sign in. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during sign in: $e');
      throw e;
    }
  }


  final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

}