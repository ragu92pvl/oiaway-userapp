


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/grocery/grocery_product_response.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/grocery_controller.dart';
import '../../model/response/grocery/grocery_data_response.dart';

class GroceryProductPage extends StatefulWidget {

  GroceryData groceryData;
  GroceryProductPage(this.groceryData,{super.key});

  @override
  _GroceryProductPageState createState() => _GroceryProductPageState();
}

class _GroceryProductPageState extends StateX<GroceryProductPage> {

  _GroceryProductPageState() : super(controller: GroceryController(), useInherited: true) {
    con = controller as GroceryController;
  }
  late GroceryController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getGroceryProduct(context, widget.groceryData.id!);
  }

  // void _showVariantDialog(BuildContext context, OverallGroceryProducts productData, GroceryController con) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => VariantDialog(productData,con),
  //   );
  // }



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
          InkWell(
            onTap: (){
            //con.getGroceryVendorProducts();
              context.pushNamed('grocery-checkout-page',extra: {
                "controller":con
              });
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Stack(
                    children: [
                      Icon(Icons.add_shopping_cart,color: Colors.white,size: 30,),
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                          radius: 8,
                          child: Center(child: Text(con.cartCount.toString(),style: AppStyle.fontSarabunBold.override(color: Colors.white,fontSize: 12),)))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: con.productList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    var productData =  con.productList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.network(
                          ApiConstants.IMG_BASE_URL+productData.productImage!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productData.name!, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Row(
                                children: List.generate(
                                  5,
                                      (index) => const Icon(Icons.star_border, size: 16, color: Colors.grey),
                                ),
                              ),
                              // const SizedBox(height: 6),
                              // Text("${ApiConstants.currency} ${productData.variantdetails![0].price} / ${productData.variantdetails![0].unitvalue}${productData.variantdetails![0].unit}", style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        if(productData.count ==0)
                        ElevatedButton(
                          onPressed: () {
                            //_showVariantDialog(context,productData,con);
                           con.addToCart(productData,"add");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text("Add",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.white),),
                        ),
                        if(productData.count ==1)
                        ElevatedButton(
                          onPressed: () {
                            //_showVariantDialog(context,productData,con);
                            con.addToCart(productData,"remove");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: Text("Added",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.white),),
                        ),
                      ],
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

// class VariantDialog extends StatefulWidget {
//
//   OverallGroceryProducts productData;
//   GroceryController con;
//   VariantDialog(this.productData, this.con, {super.key});
//
//   @override
//   _VariantDialogState createState() => _VariantDialogState();
// }
//
// class _VariantDialogState extends StateX<VariantDialog> {
//
//
//
//   String inputText = "";
//
//   int quantity = 1;
//
//
//   Widget weightOption(String weight, String price,VariantDetails variant) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade50,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(weight, style: const TextStyle(fontWeight: FontWeight.bold)),
//           Text("₹$price", style: const TextStyle(fontWeight: FontWeight.bold)),
//            variant.count !=0
//               ? Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.remove, size: 16),
//                 onPressed: () {
//                   setState(() {
//                     if ( variant.count > 1)  variant.count--;
//                   });
//                 },
//               ),
//               Text('${ variant.count}'),
//               IconButton(
//                 icon: const Icon(Icons.add, size: 16),
//                 onPressed: () {
//                   setState(() {
//                     variant.count++;
//                   });
//                 },
//               ),
//             ],
//           )
//               : ElevatedButton(
//             onPressed: () {
//               setState((){
//                 //showCounter = true;
//                 widget.con.createCart(context,variant);
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//             ),
//             child: Text("Add",style: AppStyle.fontSarabunBold.override(fontSize: 14,color: Colors.white),),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//     content: Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             children: [
//               Image.network(
//                 ApiConstants.IMG_BASE_URL + widget.productData.productImage!,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(widget.productData.productName!, style: TextStyle(fontWeight: FontWeight.bold)),
//                   Row(
//                     children: List.generate(
//                       5,
//                           (index) => const Icon(Icons.star_border, size: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           ListView.builder(
//             itemCount: widget.productData.variantdetails!.length,
//               shrinkWrap: true,
//               itemBuilder: (context,index){
//               var variant = widget.productData.variantdetails![index];
//               var unit = variant.unitvalue!+" "+variant.unit!;
//               return weightOption(unit, variant.price.toString(),variant);
//           }),
//         ],
//       ),
//     ),
//     );
//
//   }
// }

