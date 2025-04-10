


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:state_extended/state_extended.dart';
import 'package:userapp/constants/api_constants.dart';
import 'package:userapp/constants/app_style.dart';
import 'package:userapp/flutter_flow/flutter_flow_theme.dart';
import 'package:userapp/model/response/home/home_data_response.dart';

import '../../../controller/home_controller.dart';

class BuyPage extends StatefulWidget {
  HomeController con;
  BuyPage(this.con, {super.key});

  @override
  _BuyPageState createState() => _BuyPageState(this.con);
}

class _BuyPageState extends StateX<BuyPage> {
  HomeController con;
  _BuyPageState(this.con);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con.getDataInformation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: con.homeDataResponse.bannerData!=null ?  Column(
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
                items: con.homeDataResponse.bannerData?.map((index) {
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
                    itemCount: con.homeDataResponse.categoryData?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var categoryData =
                      con.homeDataResponse.categoryData![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(
                              'subcategory-page',
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
                                      categoryData.catImage!
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
                                categoryData.catName!,
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
