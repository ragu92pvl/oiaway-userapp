


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/home_controller.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({super.key});

  @override
  _AllCategoryPageState createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends StateX<AllCategoryPage> {

  _AllCategoryPageState() : super(controller: HomeController(), useInherited: true) {
    _con = controller as HomeController;
  }
  late HomeController _con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.getAllCategory(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Category",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: _con.allCategoryResponse.productCategoryData != null ? SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                              "Category",
                              style: AppStyle.fontSarabunMedium.override(fontSize: 16)
                          ),
                        ],
                      ),
                    ],
                  ),
                  GridView.builder(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        childAspectRatio: 0.8,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:
                      _con.allCategoryResponse.productCategoryData?.length,
                      itemBuilder: (BuildContext ctx, position) {
                        var categoryData =
                        _con.allCategoryResponse.productCategoryData![position];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                onTap: () {
                                  //moveSubCategory(serviceData);
                                  context.pushNamed(
                                    'subcategory-page',
                                    extra: {
                                      'categoryData': categoryData,
                                    },
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: ApiConstants.IMG_BASE_URL +
                                        categoryData.catImage!,
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                categoryData.catName!,
                                style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      }),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                                "Services",
                                style: AppStyle.fontSarabunMedium.override(fontSize: 16)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child:  GridView.builder(
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:
                        _con.allCategoryResponse.serviceCategoryData?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          var serviceData =
                          _con.allCategoryResponse.serviceCategoryData![index];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF3F3F3),
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    //moveScreen(serviceData);
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: ApiConstants.IMG_BASE_URL +
                                          serviceData.serviceImg!,
                                      placeholder: (context, url) => Center(
                                        child: Container(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator()),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  serviceData.serviceName!,
                                  style: AppStyle.fontSarabunMedium.override(fontSize: 14),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ):Container(),
    );
  }
}
