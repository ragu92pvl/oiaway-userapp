

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/controller/address_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';

class AddressPage extends StatefulWidget {

  const AddressPage({super.key});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends StateX<AddressPage> {

  _AddressPageState() : super(controller: AddressController(), useInherited: true) {
    con = controller as AddressController;
  }
  late AddressController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getAddress(context);
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
          "My Address",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 45,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: con.addressList.length,
                  itemBuilder: (context,index){
                    var records = con.addressList[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                                      records.type!,
                                      style: const TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(records.address!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(height: 4),
                                  Text("${records.houseno!}, ${records.landmark}, ${records.pincode}",
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      )),


                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Icon(Icons.edit,color: Colors.green,),
                                SizedBox(height: 15,),
                                InkWell(
                                  child: Icon(Icons.delete,color: Colors.red,),
                                  onTap: (){
                                    //con.deleteRecords(context, records.id!);
                                    con.deleteAddress(context, records.id!);
                                  },)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () async {
                  await context.pushNamed('add-address-page').then((e){
                    con.getAddress(context);
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white,Colors.white], // Gradient colors
                      begin: Alignment.topCenter, // Gradient start
                      end: Alignment.bottomCenter, // Gradient end
                    ),
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    border: Border.all(color: Colors.white, width: 2), // Border
                  ),
                  child: Center(
                    child: Text(
                      "+ Add Address",
                      style: AppStyle.fontSarabunBold.override(color: AppColors.themeColor,fontSize: 16),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
