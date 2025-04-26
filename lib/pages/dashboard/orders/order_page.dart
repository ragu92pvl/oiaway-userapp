

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/controller/home_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_style.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends StateX<OrderPage> {

  _OrderPageState() : super(controller: HomeController(), useInherited: true) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getMyOrders(context);
  }

  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: con.orderList.length,
                  itemBuilder: (context,index){
                  var orderBean = con.orderList[index];
                  var highLightsArray = orderBean.productdetails!.productHighlights?.split(",");
                return InkWell(
                  onTap: (){
                    context.pushNamed('order-details-page',extra: {
                      "orderBean":orderBean
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              ApiConstants.IMG_BASE_URL+orderBean.productdetails!.productImage!, // Replace with actual image
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          // Product Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderBean.productdetails!.productName!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    5,
                                        (index) => Icon(Icons.star_border, size: 14),
                                  ),
                                ),
                                SizedBox(height: 4),
                                GridView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: 1.5,
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
                                SizedBox(height: 4),
                                Text(
                                  ApiConstants.currency+orderBean.oTotal!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Status
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "In Transit",
                              style: TextStyle(
                                color: Colors.green[800],
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
