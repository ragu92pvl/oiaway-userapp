


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/address/address_response.dart';
import 'package:userapp/model/response/service/service_package_response.dart';

import '../../constants/api_constants.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_style.dart';
import '../../controller/service_controller.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../model/response/records/records_data_response.dart';

class ServiceCheckOutPage extends StatefulWidget {
  PackageData? packageData;
  ServiceCheckOutPage(this.packageData, {super.key});

  @override
  _ServiceCheckOutPageState createState() => _ServiceCheckOutPageState();

}

class _ServiceCheckOutPageState extends StateX<ServiceCheckOutPage> {

  _ServiceCheckOutPageState() : super(controller: ServiceController(), useInherited: true) {
    con = controller as ServiceController;
  }
  late ServiceController con;

  RecordsData? recordsData;
  AddressData? addressData;
  String _selectedDate = "Selected Date";
  String _selectedTime = "Selected Time";
  List<String>? highLightsArray;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    highLightsArray  = widget.packageData!.specification?.split(",");
    con.total = double.parse(widget.packageData!.packagePrice!);
    con.grandTotal = double.parse(widget.packageData!.packagePrice!);
  }

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _selectedDate = DateFormat('dd MMM yyyy').format(picked); // e.g., 22 Apr 2025
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      final String formatted = DateFormat('hh:mm a').format(dt);

      setState(() {
        selectedTime = picked;
        _selectedTime = formatted;
      });
    }
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
          "Check Out",
          style: AppStyle.fontSarabunMedium.override(fontSize: 16,color: Colors.white),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: (){
                  context.pushNamed('my-records-page').then((e){
                      recordsData = e as RecordsData;
                      notifyClients();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Light grey fill
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select product",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              if(recordsData!=null)
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // AC Image
                          if(recordsData!.recordType == ApiConstants.PATIENT)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset("assets/images/patient.png",height: 90,width: 90,),
                            ),
                          if(recordsData!.recordType == ApiConstants.CAR)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset("assets/images/car.png",height: 90,width: 90,),
                            ),
                          if(recordsData!.recordType == ApiConstants.ACCESSORIES)
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
                                Text(recordsData!.title!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                const SizedBox(height: 4),
                                Text(recordsData!.description!,
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
                                    recordsData!.recordType!,
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      if(recordsData!.amcProductId!="2" && recordsData!.amc=="1")
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
              ),
              SizedBox(height: 10,),
              Text("Service Date and Time",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Light grey fill
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate,
                            style: AppStyle.fontSarabunBold.override(fontSize: 14),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.calendar_month)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      _selectTime(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Light grey fill
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedTime,
                            style:AppStyle.fontSarabunBold.override(fontSize: 14),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.timelapse)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text("Location",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
              SizedBox(height: 10,),
              if(addressData!=null)
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                                addressData!.type!,
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(addressData!.address!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                )),
                            const SizedBox(height: 4),
                            Text("${addressData!.houseno!}, ${addressData!.landmark}, ${addressData!.pincode}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                )),
          
          
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if(addressData == null)
              InkWell(
                onTap: (){
                  context.pushNamed('address-page').then((e){
                    addressData = e as AddressData;
                    notifyClients();
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Light grey fill
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Address",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                ),
              ),
              SizedBox(height: 10,),
              Text("Order Summary",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
              SizedBox(height: 10,),
              if(widget.packageData!=null)
              Card(
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
                          ApiConstants.IMG_BASE_URL+"/"+widget.packageData!.image!,
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
                              widget.packageData!.title!,
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
                              ApiConstants.currency+widget.packageData!.packagePrice!,
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
                                                highLightsArray![index],
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
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                  Text("${ApiConstants.currency}${con.total}",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tax",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                  Text("${ApiConstants.currency}${con.tax}",style: AppStyle.fontSarabunBold.override(fontSize: 14),),
                ],
              ),
              Divider(color: Colors.grey.shade300,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
                  Text("${ApiConstants.currency}${con.grandTotal}",style: AppStyle.fontSarabunBold.override(fontSize: 16),),
                ],
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  con.serviceRequest.packageId = widget.packageData!.id;
                  con.serviceRequest.stotal = con.grandTotal.toString();
                  con.serviceRequest.date = _selectedDate;
                  con.serviceRequest.time = _selectedTime;
                  con.serviceRequest.recordId = recordsData!.id;
                  con.serviceRequest.addressId = addressData!.id;
                  con.serviceRequest.model = "";
                  con.serviceRequest.brand = "";
                  con.serviceRequest.type = "";
                  con.createService(context);
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
                      "Process to Checkout",
                      style: AppStyle.fontSarabunBold.override(color: Colors.white,fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
