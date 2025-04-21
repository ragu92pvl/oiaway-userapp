


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/records_controller.dart';
import '../../model/response/records/records_data_response.dart';

class PackagesListPage extends StatefulWidget {
  RecordsData recordsData;
  PackagesListPage(this.recordsData, {super.key});

  @override
  _PackagesListPageState createState() => _PackagesListPageState();
}

class _PackagesListPageState extends StateX<PackagesListPage> {

  _PackagesListPageState() : super(controller: RecordsController(), useInherited: true) {
    con = controller as RecordsController;
  }
  late RecordsController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getAmcPackages(context, widget.recordsData.amcProductId!);
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
          "Packages",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: con.amcPackagesList.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                var amc = con.amcPackagesList[index];
                var amcArray = amc.spare!.split("||");
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.shade200.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.teal.shade700,
                    width:  1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            amc.durationdays!+" Days",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          amc.name!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ApiConstants.currency+amc.price!,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey.shade200,),
                    Text(
                      "Coverage Products",
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    ...amcArray.map(
                          (feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                feature,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey.shade200,),
                    Text(
                      "Description",
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      amc.description!,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Pay Now",
                            style: AppStyle.fontSarabunMedium.override(fontSize: 14,color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: double.infinity,
                        height: 40,
                      ),
                      onTap: (){
                         con.updateAmcProducts(context,widget.recordsData!);
                        //context.pushNamed('package-payment-success');
                      },
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
