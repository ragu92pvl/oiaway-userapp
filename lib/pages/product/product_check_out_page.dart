

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/product/product_response.dart';

import '../../constants/api_constants.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/home_controller.dart';
import '../../model/response/address/address_response.dart';
import '../../model/response/product/product_offer_response.dart';

class ProductCheckOutPage extends StatefulWidget {
  ProductData productData;
  ProductOffersData productOffersData;
  ProductCheckOutPage(this.productData, this.productOffersData, {super.key});

  @override
  _ProductCheckOutPageState createState() => _ProductCheckOutPageState();
}

class _ProductCheckOutPageState extends StateX<ProductCheckOutPage> {

  _ProductCheckOutPageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  AddressData? addressData;
  var highLightsArray;
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
          "Check Out",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
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
                                                color: Colors.white,
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
                                  SizedBox(height: 10,),
                                  Text(
                                    ApiConstants.currency + widget.productOffersData.offerPrice!,
                                    style: AppStyle.fontSarabunBold.override(fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Delivery Address",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
                SizedBox(height: 10,),
                if(addressData!=null)
                  Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // AC Image
                          // AC Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    addressData!.type!,
                                    style: AppStyle.fontSarabunBold.override(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(addressData!.address!,
                                    style: AppStyle.fontSarabunBold.override(fontSize: 14)),
                                const SizedBox(height: 4),
                                Text("${addressData!.houseno!}, ${addressData!.landmark}, ${addressData!.pincode}",
                                    style:AppStyle.fontSarabunMedium.override(fontSize: 14)),

                                const SizedBox(height: 4),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: (){
                                      context.pushNamed('address-page').then((e){
                                        addressData = e as AddressData;
                                        notifyClients();
                                      });
                                    },
                                    child: Text("change address",
                                        style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.green)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if(addressData == null)
                  InkWell(
                    onTap: (){
                      context.pushNamed('address-page').then((e){
                        addressData = e as AddressData;
                        notifyClients();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Light grey fill
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Address",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 20,),
                Text("Price Details",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
                    Text(ApiConstants.currency+"${widget.productOffersData.price}",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount",style: AppStyle.fontSarabunBold.override(fontSize: 18,color: Colors.green),),
                    Text(ApiConstants.currency+"${double.parse(widget.productOffersData.price!) - double.parse(widget.productOffersData.offerPrice!)}",style: AppStyle.fontSarabunBold.override(fontSize: 18,color: Colors.green),),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.grey.shade300,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
                    Text(ApiConstants.currency+"${widget.productOffersData.offerPrice!}",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side: Payable Amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Payable Amount',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ApiConstants.currency+ widget.productOffersData.offerPrice!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    // Right side: Button
                    ElevatedButton(
                      onPressed: () {
                        // Your order logic here
                        con.orderRequest.addressId = addressData!.id!;
                        con.orderRequest.productId = widget.productData.id!;
                        con.orderRequest.vendorId = widget.productOffersData.vendorId!;
                        con.orderRequest.transId = "";
                        con.orderRequest.oTotal = widget.productOffersData.offerPrice!;
                        con.orderRequest.subTotal = widget.productOffersData.price!;
                        con.orderRequest.discount = (double.parse(widget.productOffersData.price!) - double.parse(widget.productOffersData.offerPrice!)).toString();
                        con.orderRequest.tax = 0.0.toString();
                        con.createOrder(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.themeColor,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Placed Order',style: AppStyle.fontSarabunMedium.override(fontSize: 14,color: Colors.white),),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
