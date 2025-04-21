


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:userapp/constants/app_style.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

class PackagePaymentSuccessPage extends StatefulWidget {
  const PackagePaymentSuccessPage({super.key});

  @override
  State<PackagePaymentSuccessPage> createState() => _PackagePaymentSuccessPageState();
}

class _PackagePaymentSuccessPageState extends State<PackagePaymentSuccessPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Paid Successfully",style: AppStyle.fontSarabunBold.override(fontSize: 25,color: Colors.black87),)),
          SizedBox(height: 40,),
          Image.asset("assets/images/check.png",height: 100,),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 60,right: 60),
            child: InkWell(
              onTap: (){
                context.pop();
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
