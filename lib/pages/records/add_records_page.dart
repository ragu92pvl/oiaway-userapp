


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/product/amc_products_response.dart';
import 'package:userapp/utils/validation_utils.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/records_controller.dart';

class AddRecordsPage extends StatefulWidget {

  const AddRecordsPage({super.key});

  @override
  _AddRecordsPageState createState() => _AddRecordsPageState();
}

class _AddRecordsPageState extends StateX<AddRecordsPage> {

  _AddRecordsPageState() : super(controller: RecordsController(), useInherited: true) {
    con = controller as RecordsController;
  }
  late RecordsController con;
  String? selectedType;
  final List<String> types = ['Car', 'Patient', 'Accessories'];
  String? selectedProduct;
  AmcProductData? amcProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getAmcProducts(context);
  }

  void showAmdProductDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Makes dialog height dynamic
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Product",
                          style: AppStyle.fontSarabunMedium
                              .override(fontSize: 16, color: Colors.black87),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, color: Colors.black87, size: 25),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey.shade500),
                    const SizedBox(height: 5),
                    Text("Note: In case the product you want to select is not listed below, please choose Others to create an AMC for a non-listed product.",
                    style: AppStyle.fontSarabunMedium.override(fontSize: 12,color: Colors.grey),),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 300, // Set a height to prevent infinite list error
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: con.amcProductList.length,
                        itemBuilder: (context, index) {
                          var amc = con.amcProductList[index];
                          return GestureDetector(
                            onTap: (){
                              selectedProduct = amc.productName;
                              amcProduct = amc;
                              Navigator.pop(context);
                              notifyClients();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.black87, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    amc.productName!,
                                    style: AppStyle.fontSarabunMedium
                                        .override(fontSize: 14, color: Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
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
          "Add Records",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: con.serviceKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: InputDecoration(
                  hintText: 'Select Type',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: types.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue!;
                  });
                },
              ),
              if(selectedType!=null)
              Column(
                children: [
                  SizedBox(height: 10,),
                  if(selectedType == "Accessories")
                  InkWell(
                    onTap: (){
                      showAmdProductDialog(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                        border: Border.all(color: Colors.black87, width: 1), // Border
                      ),
                      child: Center(
                        child: Text(
                         selectedProduct ?? "Select Product",
                          style: AppStyle.fontSarabunBold.override(color: Colors.black87,fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  if(selectedType == "Accessories")
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (e){
                      con.recordsRequest.title = e;
                    },
                    decoration: InputDecoration(
                      hintText: selectedType== "Car" ? "Enter car name and model" : selectedType== "Patient" ? "Enter patient name":  "Enter accessories",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  SizedBox(height: 10,),

                  TextFormField(
                    onChanged: (e){
                      con.recordsRequest.description = e;
                    },
                    decoration: InputDecoration(
                      hintText: selectedType== "Car" ? "Enter car information" : selectedType== "Patient" ? "Enter patient information":  "Enter accessories information",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      if(selectedType == "Accessories" && amcProduct==null){
                        ValidationUtils.showAppToast("Select Product");
                      }else {
                        con.recordsRequest.recordType = selectedType;
                        con.addRecords(context, selectedType,amcProduct);
                      }
                    },
                    child: Container(
                      width: double.infinity,
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
                          "Save",
                          style: AppStyle.fontSarabunBold.override(color: Colors.white,fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
