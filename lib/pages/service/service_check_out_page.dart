


import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class ServiceCheckOutPage extends StatefulWidget {
  const ServiceCheckOutPage({super.key});

  @override
  _ServiceCheckOutPageState createState() => _ServiceCheckOutPageState();

}

class _ServiceCheckOutPageState extends StateX<ServiceCheckOutPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set your desired back button color
        ),
        title: Text(
          "Check Out",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
    );
  }

}
