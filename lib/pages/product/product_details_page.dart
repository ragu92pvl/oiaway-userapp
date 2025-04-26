


import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/home/home_data_response.dart';
import 'package:userapp/model/response/product/product_response.dart';
import 'package:userapp/model/response/product/sub_category_response.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  CategoryData categoryData;
  SubCategoryData subCategoryData;
  ProductData? productData;
  ProductDetailsPage(this.categoryData,this.subCategoryData,this.productData, {super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends StateX<ProductDetailsPage> {

  var highLightsArray;
  double? ratingBarValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    highLightsArray = widget.productData!.productHighlights?.split(",");
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
          "",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: 100,
                  height: 250,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: widget.productData!.productGallery!=null ? CarouselSlider(
                    options: CarouselOptions(height: 400.0, autoPlay: true),
                    items: widget.productData!.productGallery?.map((index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: CachedNetworkImage(
                              imageUrl: ApiConstants.IMG_BASE_URL +
                                  index.fileName.toString(),
                              placeholder: (context, url) => Center(
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ): Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: CachedNetworkImage(
                      imageUrl: ApiConstants.IMG_BASE_URL +
                          widget.productData!.productImage!,
                      placeholder: (context, url) => Center(
                        child: Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productData!.productName!,
                      style: AppStyle.fontSarabunBold.override(fontSize: 18),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: highLightsArray!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      height: 30,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F4F4),
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  highLightsArray[index],
                                  style: AppStyle.fontSarabunMedium.override(fontSize: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        direction: Axis.horizontal,
                        initialRating: double.parse(widget.productData!.rating!),
                        unratedColor: Color(0xFF9E9E9E),
                        itemCount: 5,
                        itemSize: 15,
                        glowColor: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                      InkWell(
                        onTap: (){
                          context.pushNamed('product-offers-page',extra: {
                            "productData":widget.productData
                          });
                        },
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.themeColor, AppColors.themeColor], // Gradient colors
                              begin: Alignment.topCenter, // Gradient start
                              end: Alignment.bottomCenter, // Gradient end
                            ),
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                            border: Border.all(color: Colors.white, width: 2), // Border
                          ),
                          child: Center(
                            child: Text(
                              "Buy / Enquiry",
                              style: AppStyle.fontSarabunBold.override(color: Colors.white,fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(length: 3,
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
                            icon: Icon(Icons.directions_car),
                            text: "Specifications",
                          ),
                          Tab(
                            icon: Icon(Icons.directions_transit),
                            text: "Description",
                          ),
                          Tab(
                            icon: Icon(Icons.directions_transit),
                            text: "Reviews",
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                              child: SingleChildScrollView(
                                child: Html(
                                  data: widget.productData!.productSpec!,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10,10),
                              child: SingleChildScrollView(
                                child: Html(
                                  data: widget.productData!.productDesc!,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  //ProductReviewPage(widget.productData.id!),
                                  Container()
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
