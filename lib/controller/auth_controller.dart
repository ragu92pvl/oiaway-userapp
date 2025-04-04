


import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/model/request/login/login_request.dart';
import 'package:userapp/model/request/register/register_request.dart';
import 'package:userapp/utils/preference_utils.dart';

import '../network/api_service.dart';
import '../utils/loader.dart';
import '../utils/validation_utils.dart';

class AuthController extends StateXController{

  late var apiService = ApiService();
  final GlobalKey<FormState> serviceKey = GlobalKey<FormState>();

  var loginRequest = LoginRequest();
  var registerRequest = RegisterRequest();


  login(BuildContext context) async {
    serviceKey.currentState!.save();
    if(loginRequest.mobile.isNotEmpty){
      Loader.show();
      await apiService.signIn(loginRequest).then((value){
        Loader.hide();
        PreferenceUtils.saveUserId(value.data!.id!);
        context.go('/location');
      }).catchError((e){
        Loader.hide();
        print(e.toString());
      });
    }else{
      ValidationUtils.showAppToast("Mobile number required");
    }
  }


  register(BuildContext context) async {
    serviceKey.currentState!.save();
    if(registerRequest.name.isNotEmpty && registerRequest.email.isNotEmpty &&
        registerRequest.mobile.isNotEmpty && registerRequest.password.isNotEmpty){
      Loader.show();
      await apiService.register(registerRequest).then((value){
        Loader.hide();
        PreferenceUtils.saveUserId(value.data!.id!);
        context.go('/location');
      }).catchError((e){
        Loader.hide();
        print(e.toString());
      });
    }else{
      ValidationUtils.showAppToast("All fields are required.");
    }
  }

}