

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:userapp/utils/preference_utils.dart';

import '../../utils/loader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }

  void delay() {
    Timer(const Duration(seconds: 1), () async {
      String? userId = await PreferenceUtils.getUserId();
      if(userId!=null){
        context.replace('/location');
      }else{
        context.replace('/login');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
            Center(child: Image.asset("assets/images/logo.png",height: 200,width: 200,)),
        ],
      ),
    );
  }
}
