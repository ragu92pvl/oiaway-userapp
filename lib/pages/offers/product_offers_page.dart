


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/product/product_response.dart';

import '../../constants/api_constants.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/home_controller.dart';

class ProductOffersPage extends StatefulWidget {

  ProductData productData;

  ProductOffersPage(this.productData, {super.key});

  @override
  _ProductOffersPageState createState() => _ProductOffersPageState();
}

class _ProductOffersPageState extends StateX<ProductOffersPage> {


  _ProductOffersPageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;
  var highLightsArray;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    highLightsArray = widget.productData!.productHighlights?.split(",");
    con.getProductsOffers(context, widget.productData.id!);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: con.productOfferList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
          var offerData = con.productOfferList[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              width: 300,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top Section: Image + Title + Tags
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ApiConstants.IMG_BASE_URL +
                              widget.productData!.productImage!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productData.productName!,
                              style: AppStyle.fontSarabunBold.override(fontSize: 16),
                            ),
                            SizedBox(height: 6),
                            GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
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
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 12),

                  // Price Section
                  Text(
                    ApiConstants.currency + offerData.offerPrice!,
                    style: AppStyle.fontSarabunBold.override(fontSize: 18),
                  ),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.pushNamed('product-check-out-page',extra: {
                            "productData":widget.productData,
                            "offerData":offerData
                          });
                        },
                        child: Text('Buy Now',style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Enquiry',style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.black87),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }


}
