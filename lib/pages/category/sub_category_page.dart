


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/home/home_data_response.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/home_controller.dart';

class SubCategoryPage extends StatefulWidget {
  CategoryData categoryData;
  SubCategoryPage(this.categoryData, {super.key});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends StateX<SubCategoryPage> {

  _SubCategoryPageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getSubCategory(context,widget.categoryData.id!);
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
          widget.categoryData.catName!,
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            scrollDirection: Axis.vertical,
            itemCount:
            con.subCategoryList.length,
            itemBuilder: (BuildContext ctx, index) {
              var subCategoryData =
              con.subCategoryList[index];
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      context.pushNamed(
                        'product-list',
                        extra: {
                          'categoryData': widget.categoryData,
                          'subCategoryData': subCategoryData,
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200, // light gray background
                      ),
                      padding: const EdgeInsets.all(12),
                      child: CachedNetworkImage(
                        height: 55,
                        width: 55,
                        imageUrl: ApiConstants.IMG_BASE_URL +
                            subCategoryData.image!
                                .toString()
                                .replaceAll("%0A", ''),
                        placeholder: (context, url) => Center(
                          child: Container(
                              height: 20,
                              width: 20,
                              child:
                              CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Text(
                      subCategoryData.title!,
                      style: AppStyle.fontSarabunMedium.override(fontSize: 14,color: Colors.black87),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
