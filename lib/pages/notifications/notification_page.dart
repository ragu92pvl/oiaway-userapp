

import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/home_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends StateX<NotificationPage> {

  _NotificationPageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getNotifications(context);
  }

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
          "Notifications",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: con.notificationsList.length,
                itemBuilder: (BuildContext context,int index){
                  var dataBean = con.notificationsList[index];
                  return // Generated code for this Card Widget...
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  ApiConstants.IMG_BASE_URL+dataBean!.image!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            dataBean.title!,
                                            style: AppStyle.fontSarabunMedium.override(fontSize: 14)

                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataBean.datetime!,
                                                style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                              ),
                                              dataBean.type == "service" ?
                                              Text(
                                                "Service Request",
                                                style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                              ):  Text(
                                                "Product Enquiry",
                                                style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                })
          ],
        ),
      ),
    );
  }

}
