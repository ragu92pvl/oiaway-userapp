


import 'package:flutter/material.dart';
import 'package:userapp/controller/grocery_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/api_constants.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class GroceryCheckoutPage extends StatefulWidget {
  GroceryController con;
  GroceryCheckoutPage(this.con, {super.key});

  @override
  State<GroceryCheckoutPage> createState() => _GroceryCheckoutPageState();
}

class _GroceryCheckoutPageState extends State<GroceryCheckoutPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.con.getGroceryVendorProducts(widget.con.cartList);
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
        child: Column(
          children: [
            Text("(${widget.con.vendorsList!.length}) offers",style: AppStyle.fontSarabunBold.override(fontSize: 18),),
            SizedBox(height: 10,),
            ListView.builder(
                itemCount: widget.con.vendorsList!.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  var vendorBean = widget.con.vendorsList![index];
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
                    itemBuilder: (context,index){
                      var products = vendorBean.products![index];
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
                                          },
                                        ),
                                      ],
                                    )
                                        : ElevatedButton(
                                      onPressed: () {
                                        setState((){
                                          //showCounter = true;
                                          //widget.con.createCart(context,products);
                                          products.count++;
                                          vendorBean.total = vendorBean.total +  double.parse(products.price!) * products.count;
                                        });
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
    );
  }
}
