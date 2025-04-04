

import 'dart:convert';

import 'package:dio/dio.dart';

import '../utils/preference_utils.dart';



class DioClient {
  final Dio _dio;
  String? _bearerToken = "";
  DioClient() : _dio = Dio();

  // Function to set up options with Bearer token in headers
  Options _getOptions(String bearerToken) {
    return Options(
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json; charset=UTF-8',
        'lang':'en'
        // Add other headers if needed
      },
      validateStatus: (statusCode){
        if(statusCode == null){
          return false;
        }
        if(statusCode == 201){ // your http status code
          return true;
        }if(statusCode == 204){ // your http status code
          return true;
        }if(statusCode == 409){ // your http status code
          return true;
        }
        else{
          return statusCode >= 200 && statusCode < 300;
        }
      },
    );
  }
  // Function to handle common headers and error handling
  Future<Response<T>> _handleRequest<T>(Future<Response<T>> Function() request) async {
    try {
      final response = await request();
       print(response.toString());
      return response;
    } catch (error) {
      // Handle error
      print('Error: $error');
      rethrow; // Rethrow the error for handling at a higher level
    }
  }

  // Function to make a GET request
  Future<Response<T>> get<T>(String path) async {
    String? bearerToken = await PreferenceUtils.getUserToken();
    bearerToken ??= "";
    print(path);
    print("Token: $bearerToken");
    return _handleRequest(() => _dio.get(path, options: _getOptions(bearerToken!)));
  }

  // Function to make a POST request
  Future<Response<T>> post<T>(String path, dynamic data) async {
    String? bearerToken = await PreferenceUtils.getUserToken();
    bearerToken ??= "";
    print(path);
    print("Token: $bearerToken");
    print(data.toString());
    return _handleRequest(() => _dio.post(path, data: data, options: _getOptions(bearerToken!)));
  }

  // Function to make a POST request
  Future<Response<T>> put<T>(String path, dynamic data) async {
    String? bearerToken = await PreferenceUtils.getUserToken();
    bearerToken ??= "";
    print(path);
    print("Token: $bearerToken");
    print(data.toString());
    return _handleRequest(() => _dio.put(path, data: data, options: _getOptions(bearerToken!)));
  }

  // Function to make a GET request
  Future<Response<T>> delete<T>(String path) async {
    String? bearerToken = await PreferenceUtils.getUserToken();
    bearerToken ??= "";
    print(path);
    print("Token: $bearerToken");
    return _handleRequest(() => _dio.delete(path, options: _getOptions(bearerToken!)));
  }
}