


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/service/my_service_response.dart';
import 'package:userapp/model/response/service/service_category_response.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';
import '../../../controller/service_controller.dart';

class MyServiceDetailsPage extends StatefulWidget {
  MyServiceData serviceData;
  MyServiceDetailsPage(this.serviceData, {super.key});

  @override
  _MyServiceDetailsPageState createState() => _MyServiceDetailsPageState();
}

class _MyServiceDetailsPageState extends StateX<MyServiceDetailsPage> {

  _MyServiceDetailsPageState() : super(controller: ServiceController(), useInherited: true) {
    con = controller as ServiceController;
  }
  late ServiceController con;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.serviceDetails(context,widget.serviceData.id!);
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
          "Service Details",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 60),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Order Details',
                        textAlign: TextAlign.start,
                        style: AppStyle.fontSarabunBold.override(fontSize: 16)
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                                Image.network(
                                  ApiConstants.IMG_BASE_URL+con.serviceDetailsResponse.addressData![0].image!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          con.serviceDetailsResponse.addressData![0].titile!,
                                          maxLines: 2,
                                          style: AppStyle.fontSarabunBold.override(fontSize: 13),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                ApiConstants.currency+con.serviceDetailsResponse.addressData![0].packageprice!,
                                                style:AppStyle.fontSarabunBold.override(fontSize: 16),
                                              ),
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Technician Details',
                          textAlign: TextAlign.start,
                          style: AppStyle.fontSarabunBold.override(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  con.serviceDetailsResponse.addressData![0].providerName!=null ? Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_history,
                                      color: Colors.black,
                                      size: 80,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              con!.serviceDetailsResponse.addressData![0].providerName!,
                                              maxLines: 2,
                                              style: AppStyle.fontSarabunBold.override(fontSize: 13),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    con!.serviceDetailsResponse.addressData![0].providerMobile!,
                                                    style:
                                                    AppStyle.fontSarabunBold.override(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                      child: Icon(
                                        Icons.call,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ):
                  Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(),
                        child: Lottie.network(
                          'https://assets1.lottiefiles.com/packages/lf20_gvg3hlwz.json',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          'We are Shortly Assign Service Provider',
                          textAlign: TextAlign.center,
                          style: AppStyle.fontSarabunBold.override(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'ADD-ON Details',
                      textAlign: TextAlign.start,
                      style: AppStyle.fontSarabunBold.override(fontSize: 16),
                    ),
                  ),
                  con.serviceDetailsResponse.addressData![0].providerName!=null ? Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:  con!.serviceDetailsResponse.addressData![0].addon!.length,
                                itemBuilder: (BuildContext context, int index){
                                  var addOnBean = con!.serviceDetailsResponse.addressData![0].addon![index];
                                  //getServiceTotal(int.parse(addOnBean.sprice!));

                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                addOnBean.spname!,
                                                textAlign: TextAlign.start,
                                                style: AppStyle.fontSarabunBold.override(fontSize: 16),
                                              ),
                                              Text(
                                                '1x',
                                                style: AppStyle.fontSarabunBold.override(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                               ApiConstants.currency+addOnBean.price!,
                                                style: AppStyle.fontSarabunBold.override(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                    ],
                                  );
                                }),
                          )
                          // ,

                        ],
                      ),
                    ),
                  ):  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'No Addon Found',
                      textAlign: TextAlign.center,
                      style: AppStyle.fontSarabunBold.override(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Amount Details',
                      textAlign: TextAlign.start,
                      style: AppStyle.fontSarabunBold.override(fontSize: 16),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'ADD-ON Price',
                          //       style:
                          //       FlutterFlowTheme.of(context).bodyText1.override(
                          //         fontFamily: 'Poppins',
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     Text(
                          //       'Rs.5000',
                          //       style:
                          //       FlutterFlowTheme.of(context).bodyText1.override(
                          //         fontFamily: 'Poppins',
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sub Total',
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                                Text(
                                  ApiConstants.currency+con!.serviceDetailsResponse.addressData![0].stotal!,
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Tax',
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                                Text(
                                  ApiConstants.currency+"0",
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                                Text(
                                 ApiConstants.currency+con!.serviceDetailsResponse.addressData![0].stotal!,
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Location',
                      textAlign: TextAlign.start,
                      style: AppStyle.fontSarabunBold.override(fontSize: 16),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Row(
                          //   mainAxisSize: MainAxisSize.max,
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       'ADD-ON Price',
                          //       style:
                          //       FlutterFlowTheme.of(context).bodyText1.override(
                          //         fontFamily: 'Poppins',
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     Text(
                          //       'Rs.5000',
                          //       style:
                          //       FlutterFlowTheme.of(context).bodyText1.override(
                          //         fontFamily: 'Poppins',
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(
                                 ApiConstants.currency+con!.serviceDetailsResponse.addressData![0].address!,
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Order Status',
                      textAlign: TextAlign.start,
                      style: AppStyle.fontSarabunBold.override(fontSize: 16),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment Status',
                                style:
                                AppStyle.fontSarabunBold.override(fontSize: 16),
                              ),
                              Text(
                                'Cash after Service',
                                style:
                                AppStyle.fontSarabunBold.override(fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Status',
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                                Container(
                                  width: 100,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF78686),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    con!.serviceDetailsResponse.addressData![0].serviceStatus!,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.fontSarabunBold.override(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),



                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Date',
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),

                                Text(
                                  con!.serviceDetailsResponse.addressData![0].jobdate!,
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Time',
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                                Text(
                                  con!.serviceDetailsResponse.addressData![0].jobTime!,
                                  style:
                                  AppStyle.fontSarabunBold.override(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Generated code for this Text Widget...
                  con!.serviceDetailsResponse.addressData![0].servicePhotos!.isNotEmpty ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [ Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Service Photos',
                        textAlign: TextAlign.start,
                        style: AppStyle.fontSarabunBold.override(fontSize: 16),
                      ),
                    ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: ListView.builder(
                          itemCount:con!.serviceDetailsResponse.addressData![0].servicePhotos!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index){
                            var servicePhotos  = con!.serviceDetailsResponse.addressData![0].servicePhotos![index];
                            return  Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                                child: Image.network(
                                  ApiConstants.BASE_URL+"uploads/"+servicePhotos.photo!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),],
                  ):Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
