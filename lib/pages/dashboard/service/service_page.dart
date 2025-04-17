

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/controller/service_controller.dart';

import '../../../constants/api_constants.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends StateX<ServicePage> {


  _ServicePageState() : super(controller: ServiceController(), useInherited: true) {
    con = controller as ServiceController;
  }
  late ServiceController con;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getHomeServiceData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: con.serviceCategoryResponse.bannerData!=null ?  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: con.serviceCategoryResponse.bannerData?.map((index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: CachedNetworkImage(
                            imageUrl: ApiConstants.IMG_BASE_URL+index.img.toString(),
                            placeholder: (context, url) => Center(
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:3,
                        mainAxisSpacing:3,
                        childAspectRatio: 0.85,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: con.serviceCategoryResponse.serviceData?.length,
                      itemBuilder: (BuildContext context, int index) {
                        var categoryData =
                        con.serviceCategoryResponse.serviceData![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              context.pushNamed(
                                'service-list-packages-page',
                                extra: {
                                  'categoryData': categoryData,
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200, // light gray background
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: CachedNetworkImage(
                                    height: 55,
                                    width: 55,
                                    imageUrl: ApiConstants.IMG_BASE_URL +
                                        categoryData.serviceImg!
                                            .toString()
                                            .replaceAll("%0A", ''),
                                    placeholder: (context, url) => Center(
                                      child: Container(
                                          height: 20,
                                          width: 20,
                                          child:
                                          CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  categoryData.serviceName!,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ):Container()
      ),
    );
  }
}
