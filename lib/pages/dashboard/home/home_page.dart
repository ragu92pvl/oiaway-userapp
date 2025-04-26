

import 'dart:developer';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/controller/home_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/pages/dashboard/grocery/grocery_page.dart';
import 'package:userapp/pages/dashboard/home/buy_page.dart';
import 'package:userapp/pages/dashboard/service/service_page.dart';
import 'package:userapp/utils/preference_utils.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateX<HomePage> {


  _HomePageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getDataInformation(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200), // Set this height
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.themeColor, // Top color
                Color(0xFf7BAEFF), // Bottom color
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(color: Colors.white, width: 0),
          ),
          child:Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          context.pushNamed('address-page');
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white38, // Background color
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                            border: Border.all(color: Colors.white, width: 1), // White border
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_pin, color: Colors.white, size: 30),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location",
                                    style: AppStyle.fontSarabunBold.override(color: Colors.white, fontSize: 14),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      con.address ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppStyle.fontSarabunMedium.override(color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            context.pushNamed('notifications-page');
                          },
                          child: Image.asset("assets/images/home-notification.png",height: 40,width: 40,color: Colors.white,)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Hello, ${con.userName}",style: AppStyle.fontSarabunMedium.override(color: Colors.white,fontSize: 18),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white, //     color
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                      border: Border.all(color: Colors.white, width: 1), // White border
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,color: Colors.black54,size: 16,),
                        SizedBox(width: 5,),
                        Text("Search Products",style: AppStyle.fontSarabunMedium.override(color: Colors.black54,fontSize: 14),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: DefaultTabController(length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          ButtonsTabBar(
            contentPadding: EdgeInsets.all(10.0),
            height: 50,
            radius: 20.0,
            backgroundColor: AppColors.themeColor,
            unselectedBackgroundColor: Colors.grey[200],
            unselectedLabelStyle: TextStyle(color: Colors.black),
            labelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                icon: Icon(Icons.laptop),
                text: "Buy/Enquiry",
              ),
              Tab(
                icon: Icon(Icons.miscellaneous_services),
                text: "Home Service",
              ),
              Tab(
                icon: Icon(Icons.store),
                text: "Grocery",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                BuyPage(con),
                ServicePage(),
                GroceryPage()
              ],
            ),
          ),
        ],
      ),),
    );
  }

}
