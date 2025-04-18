


import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';

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
    con.getAmcPackages(context, widget.recordsData.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemCount: con.amcPackagesList.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
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
                          "2500",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Basic",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "200",
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ...con.amcPackagesList.map(
                        (feature) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature.name!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
