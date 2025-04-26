


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_style.dart';

class ServiceSuccessPage extends StatefulWidget {
  const ServiceSuccessPage({super.key});

  @override
  State<ServiceSuccessPage> createState() => _ServiceSuccessPageState();
}

class _ServiceSuccessPageState extends State<ServiceSuccessPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Service Booked Successfully",style: AppStyle.fontSarabunBold.override(fontSize: 25,color: Colors.black87),)),
          SizedBox(height: 40,),
          Image.asset("assets/images/check.png",height: 100,),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: InkWell(
              onTap: (){
                context.go('/dashboard-page');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Back",
                    style: AppStyle.fontSarabunMedium.override(fontSize: 14,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                width: 120,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

}
