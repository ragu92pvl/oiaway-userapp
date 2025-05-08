


import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/controller/grocery_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/api_constants.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class GroceryCheckoutPage extends StatefulWidget {
  GroceryController con;
  GroceryCheckoutPage(this.con, {super.key});

  @override
  _GroceryCheckoutPageState createState() => _GroceryCheckoutPageState();
}

class _GroceryCheckoutPageState extends StateX<GroceryCheckoutPage> {

  _GroceryCheckoutPageState() : super(controller: GroceryController(), useInherited: true) {
    con = controller as GroceryController;
  }
  late GroceryController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getGroceryVendorProducts(widget.con.cartList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        actions: [

        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 40,
              child: Column(
                children: [
                  Text("(${con.vendorsList!.length}) offers",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
                  SizedBox(height: 10,),
                  ListView.builder(
                      itemCount: con.vendorsList!.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        var vendorBean = con.vendorsList![index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shop ${index}",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
                                Text("Total ${vendorBean.total}",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
                              ],
                            ),
                            ListView.builder(
                              itemBuilder: (context,pIndex){
                                var products = vendorBean.products![pIndex];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Image.network(
                                          ApiConstants.IMG_BASE_URL+"assets/groceryproducts/1.png",
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(products.variantname!, style: const TextStyle(fontWeight: FontWeight.bold)),
                                              const SizedBox(height: 6),
                                              const SizedBox(height: 6),
                                              Text("${ApiConstants.currency} ${products.price} / ${products.unitvalue}${products.unit}", style: const TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                          margin: const EdgeInsets.symmetric(vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.blue.shade50,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              products.count !=0
                                                  ? Row(
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(Icons.remove, size: 16),
                                                    onPressed: () {
                                                      setState(() {
                                                        if ( products.count > 1) { products.count--;}else {products.count = 0;};
                                                        vendorBean.total = double.parse(products.price!) * products.count;
                                                      });
                                                      con.getTotal();
                                                    },
                                                  ),
                                                  Text('${ products.count}'),
                                                  IconButton(
                                                    icon: const Icon(Icons.add, size: 16),
                                                    onPressed: () {
                                                      setState(() {
                                                        products.count++;
                                                        vendorBean.total =  double.parse(products.price!) * products.count;
                                                      });
                                                      con.getTotal();
                                                    },
                                                  ),
                                                ],
                                              )
                                                  : ElevatedButton(
                                                onPressed: () {
                                                  setState((){
                                                    for (int vIndex = 0; vIndex < con.vendorsList!.length; vIndex++) {
                                                      if (vIndex != index) {
                                                        for (var p in con.vendorsList![vIndex].products!) {
                                                          p.count = 0;
                                                        }
                                                        con.vendorsList![vIndex].total = 0;
                                                      }
                                                    }
                                                    products.count++;
                                                    vendorBean.total = vendorBean.total +  double.parse(products.price!) * products.count;
                                                  });
                                                  con.getTotal();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                ),
                                                child: Text("Add",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.white),),
                                              ),
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: vendorBean.products!.length,
                              shrinkWrap: true,
                            )
                          ],
                        );
                      })
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.themeColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Placed Order ${ApiConstants.currency} ${con.total}',style: AppStyle.fontSarabunMedium.override(fontSize: 14,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
