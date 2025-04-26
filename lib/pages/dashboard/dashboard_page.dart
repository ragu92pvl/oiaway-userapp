


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/pages/category/all_category_page.dart';
import 'package:userapp/pages/dashboard/category/category_page.dart';
import 'package:userapp/pages/dashboard/home/home_page.dart';
import 'package:userapp/pages/dashboard/orders/order_page.dart';
import 'package:userapp/pages/dashboard/profile/profile_page.dart';
import 'package:userapp/pages/dashboard/service/my_service_page.dart';
import 'package:userapp/pages/dashboard/service/service_page.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends StateX<DashboardPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    AllCategoryPage(),
    OrderPage(),
    MyServicePage(),
    ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.themeColor,
        unselectedItemColor: Colors.white, // Unselected icon color
        selectedItemColor: Colors.white54, // Selected icon color
        currentIndex: _currentIndex,
        selectedLabelStyle: AppStyle.fontSarabunMedium,
        unselectedLabelStyle: AppStyle.fontSarabunMedium,
        onTap: (index) async {
            setState(() {
              _currentIndex = index;
            });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.propane),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
