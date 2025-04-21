


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/constants/app_colors.dart';
import 'package:userapp/controller/records_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_style.dart';

class MyRecordsPage extends StatefulWidget {
  const MyRecordsPage({super.key});

  @override
  _MyRecordsPageState createState() => _MyRecordsPageState();
}

class _MyRecordsPageState extends StateX<MyRecordsPage> {

  _MyRecordsPageState() : super(controller: RecordsController(), useInherited: true) {
    con = controller as RecordsController;
  }
  late RecordsController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getRecords(context);
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
          "My Records",
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 45,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: con.recordsList.length,
                itemBuilder: (context,index){
                var records = con.recordsList[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // AC Image
                            if(records.recordType == ApiConstants.PATIENT)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset("assets/images/patient.png",height: 90,width: 90,),
                              ),
                            if(records.recordType == ApiConstants.CAR)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset("assets/images/car.png",height: 90,width: 90,),
                              ),
                            if(records.recordType == ApiConstants.ACCESSORIES)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset("assets/images/accessories.png",height: 90,width: 90,),
                              ),
                            const SizedBox(width: 12),
                            // AC Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(records.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )),
                                  const SizedBox(height: 4),
                                  Text(records.description!,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      )),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      records.recordType!,
                                      style: const TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  )
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
                                      con.deleteRecords(context, records.id!);
                                },)
                              ],
                            )
                          ],
                        ),
                        if(records.amcProductId!="2" && records.amc=="0")
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "Create Amc +",
                              style: AppStyle.fontSarabunMedium.override(fontSize: 12,color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            width: double.infinity,
                          ),
                          onTap: (){
                            context.pushNamed('amc-packages',extra: {
                              'products':records
                            }).then((e){
                              con.getRecords(context);
                            });
                          },
                        ),
                        if(records.amcProductId!="2" && records.amc=="1")
                        Align(

                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                "View Amc Details",
                                style: AppStyle.fontSarabunMedium.override(fontSize: 12,color: Colors.white),
                              ),
                            ),
                            width: 120,
                          ),
                          alignment: Alignment.bottomRight,
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
                  await context.pushNamed('add-records-page').then((e){
                    con.getRecords(context);
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
                      "+ Add New Product",
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
