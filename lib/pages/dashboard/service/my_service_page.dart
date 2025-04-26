


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../../../controller/service_controller.dart';

class MyServicePage extends StatefulWidget {
  const MyServicePage({super.key});

  @override
  _MyServicePageState createState() => _MyServicePageState();
}

class _MyServicePageState extends StateX<MyServicePage> {


  _MyServicePageState() : super(controller: ServiceController(), useInherited: true) {
    con = controller as ServiceController;
  }
  late ServiceController con;
  double? ratingBarValue1;
  double? ratingBarValue2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getMyServices(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        automaticallyImplyLeading: false,
        title: Text(
          "My Services",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body:
      ListView.builder(
        shrinkWrap: true,
          itemCount: con.myServiceList.length,
          itemBuilder: (BuildContext context, int index){
            var packageData = con.myServiceList[index];
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  context.pushNamed('service-details-page',extra: {
                    "serviceData":packageData
                  });
                },
                child: Card(
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
                            packageData!.image!=null ?Container(
                              child: CachedNetworkImage(
                                imageUrl: ApiConstants.IMG_BASE_URL +
                                    packageData!.image!,
                                placeholder: (context, url) =>
                                    Center(
                                      child: Container(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator()),
                                    ),
                                errorWidget: (context, url,
                                    error) =>
                                    Icon(Icons.error),
                              ),
                              height: 100,
                              width: 100,
                            ):Container(
                              child: Image.asset("assets/images/WhatsApp_Image_2022-08-25_at_3.31.06_PM.jpeg"),
                              height: 100,
                              width: 100,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      packageData.title!,
                                      maxLines: 2,
                                      style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                    ),
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) =>
                                          setState(() => ratingBarValue1 = newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: ratingBarValue1 ??= 3,
                                      unratedColor: Color(0xFF9E9E9E),
                                      itemCount: 5,
                                      itemSize: 10,
                                      glowColor: FlutterFlowTheme.of(context).secondaryColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            ApiConstants.currency+packageData.price!,
                                            style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                      child: Container(
                                        width: 120,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9F4F4),
                                          borderRadius: BorderRadius.circular(10),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Home Cleaning ',
                                              style:AppStyle.fontSarabunMedium.override(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            packageData.serviceStatus == "pending" ? Row(
                              children: [
                                Icon(
                                  Icons
                                      .radio_button_checked_rounded,
                                  color: Colors.redAccent,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text("Review",
                                    style: AppStyle.fontSarabunMedium.override(fontSize: 14)),
                              ],
                            ):packageData.serviceStatus == "accepted" ?Row(
                              children: [
                                Icon(
                                  Icons
                                      .radio_button_checked_rounded,
                                  color: Colors.green,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text("Accepted",
                                    style: AppStyle.fontSarabunMedium.override(fontSize: 14)),
                              ],
                            ):packageData.serviceStatus == "completed" ?Row(
                              children: [
                                Icon(
                                  Icons
                                      .check,
                                  color: Colors.green,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text("Completed",
                                    style: AppStyle.fontSarabunMedium.override(fontSize: 14)),
                              ],
                            ):Container()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
