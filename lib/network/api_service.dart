

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userapp/model/request/register/register_request.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/location/zone_response.dart';
import 'package:userapp/model/response/login/login_response.dart';
import 'package:userapp/model/response/register/register_response.dart';
import '../constants/api_constants.dart';
import '../model/request/login/login_request.dart';
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



  final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

}