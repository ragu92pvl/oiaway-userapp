

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/controller/service_controller.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/home/home_data_response.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../model/response/service/service_category_response.dart';

class ServiceListPackagesPage extends StatefulWidget {
  ServiceData serviceData;
  ServiceListPackagesPage(this.serviceData, {super.key});

  @override
  _ServiceListPackagesPageState createState() => _ServiceListPackagesPageState();
}

class _ServiceListPackagesPageState extends StateX<ServiceListPackagesPage> {

  _ServiceListPackagesPageState() : super(controller: ServiceController(), useInherited: true) {
    con = controller as ServiceController;
  }
  late ServiceController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getServicePackages(context, widget.serviceData.id!);
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
          widget.serviceData.serviceName!,
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        children: [
          Image.asset("assets/images/service-banner.png"),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: con.packageList.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final service = con.packageList[index];
                var highLightsArray = service.specification?.split(",");
                return InkWell(
                  onTap: (){
                    context.pushNamed('service-packages-details-page',extra: {
                      "serviceData":service
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              ApiConstants.IMG_BASE_URL+"/"+service.image!,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.title!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Row(
                                  children: [
                                    Icon(Icons.star_border, size: 16, color: Colors.orange),
                                    Icon(Icons.star_border, size: 16, color: Colors.orange),
                                    Icon(Icons.star_border, size: 16, color: Colors.orange),
                                    Icon(Icons.star_border, size: 16, color: Colors.orange),
                                    Icon(Icons.star_border, size: 16, color: Colors.grey),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  ApiConstants.currency+service.packagePrice!,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                GridView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: 3,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

}
