


import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                      con.recordsRequest.recordType = selectedType;
                      con.addRecords(context,selectedType);
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
