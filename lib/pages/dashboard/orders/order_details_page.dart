


import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/app_colors.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/app_style.dart';
import '../../../model/response/order/order_response.dart';

class OrderDetailsPage extends StatefulWidget {

  OverallOrderDetails orderData;
  OrderDetailsPage(this.orderData, {super.key});

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends StateX<OrderDetailsPage> {

  var highLightsArray;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    highLightsArray = widget.orderData.productdetails!.productHighlights?.split(",");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        automaticallyImplyLeading: false,
        title: Text(
          "My Orders",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                                  widget.orderData.productdetails!.productImage!,
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
                                  widget.orderData.productdetails!.productName!,
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Order Status",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildStatusItem("Order Placed", "18 Mar, 2024 05:30 PM", widget.orderData.oStatus == "Pending" ? true: false),
                    _buildStatusItem("Order Packed", "19 Mar, 2024 04:30 PM", widget.orderData.oStatus == "Processing" ? true: false),
                    _buildStatusItem("Order Delivery", "20 Mar, 2024 03:30 PM", widget.orderData.oStatus == "Completed" ? true: false),
                    _buildStatusItem("Order Cancelled", "21 Mar, 2024 09:30 PM", widget.orderData.oStatus == "Cancelled" ? true: false),
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
                                widget.orderData.addressdetails!.type!,
                                style: AppStyle.fontSarabunBold.override(fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(widget.orderData.addressdetails!.address!,
                                style: AppStyle.fontSarabunBold.override(fontSize: 14)),
                            const SizedBox(height: 4),
                            Text("${widget.orderData.addressdetails!.houseno!}, ${widget.orderData.addressdetails!.landmark}, ${widget.orderData.addressdetails!.pincode}",
                                style:AppStyle.fontSarabunMedium.override(fontSize: 14)),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Seller Information",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
              SizedBox(height: 10,),
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.orderData.vendordetails!.shopname!,
                                style: AppStyle.fontSarabunBold.override(fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(widget.orderData.vendordetails!.address!,
                                style:AppStyle.fontSarabunMedium.override(fontSize: 14)),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Price Details",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                  Text(ApiConstants.currency+"${widget.orderData.subtotal}",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.green),),
                  Text("-"+ApiConstants.currency+"${double.parse(widget.orderData.discount!)}",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.green),),
                ],
              ),
              SizedBox(height: 5,),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                  Text(ApiConstants.currency+"${widget.orderData.oTotal}",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                ],
              ),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildStatusItem(String title, String dateTime, bool isDone) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isDone ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isDone ? Colors.green : Colors.grey,
            ),
            Container(
              width: 2,
              height: 30,
              color: isDone ? Colors.green : Colors.grey,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(dateTime, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

}
