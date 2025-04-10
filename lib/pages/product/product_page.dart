

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/constants/app_style.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/product/sub_category_response.dart';
import 'package:userapp/pages/category/sub_category_page.dart';

import '../../constants/app_colors.dart';
import '../../controller/home_controller.dart';

class ProductPage extends StatefulWidget {

  SubCategoryData subCategoryData;
  CategoryData categoryData;
  ProductPage(this.categoryData,this.subCategoryData, {super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends StateX<ProductPage> {

  _ProductPageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getProduct(context,widget.categoryData.id!,widget.subCategoryData.id!);
  }

  double? ratingBarValue;

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
          widget.subCategoryData.title!,
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
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: con.productList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){

                var productData = con.productList[index];
                var highLightsArray = productData.productHighlights?.split(",");
                return InkWell(
                  onTap: () {
                    //oveProductDetails(productData);
                    context.pushNamed('product-details-page',extra: {
                      "categoryData":widget.categoryData,
                      "subCategoryData":widget.subCategoryData,
                      "productData":productData,
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
                              Container(
                                width: 120,
                                height: 120,
                                child: CachedNetworkImage(
                                  imageUrl: ApiConstants.IMG_BASE_URL+ productData.productImage!,
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        productData.productName!,
                                        maxLines: 2,
                                        style: AppStyle.fontSarabunMedium.override(fontSize: 14,color: Colors.black87),
                                      ),
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) => setState(() => ratingBarValue = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context).secondaryColor,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: double.parse(productData.rating!),
                                        unratedColor: Color(0xFF9E9E9E),
                                        itemCount: 5,
                                        itemSize: 15,
                                        glowColor: FlutterFlowTheme.of(context).secondaryColor,
                                      ),

                                      GridView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 2,
                                            mainAxisSpacing: 2,
                                            childAspectRatio: 3,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                          highLightsArray!.length,
                                          itemBuilder: (BuildContext ctx, index) {
                                            return Container(
                                              height: 30,
                                              child: Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0, 5, 0, 0),
                                                child: Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    color: Color(
                                                        0xFFF9F4F4),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5),
                                                    shape: BoxShape
                                                        .rectangle,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(2.0),
                                                        child: Text(
                                                          highLightsArray[index],
                                                          style: AppStyle.fontSarabunMedium.override(fontSize: 8,color: Colors.grey),
                                                                                                              ),
                                                      )],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      ),

                                      // Generated code for this Row Widget...
                                      if (productData.isEnquiry==true) Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: 10,),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE6F4EA), // light green background
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.person, // you can also use Icons.group or Icons.person_outline
                                                    size: 16,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'Enquired',
                                                    style: AppStyle.fontSarabunMedium.override(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ) else Container()
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
