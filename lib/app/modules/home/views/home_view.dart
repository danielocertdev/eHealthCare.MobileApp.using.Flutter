import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../providers/laravel_provider.dart';
import '../../../services/settings_service.dart';
import '../../global_widgets/address_widget.dart';
import '../controllers/home_controller.dart';
import '../widgets/specialities_carousel_widget.dart';
import '../widgets/featured_specialities_widget.dart';
import '../widgets/recommended_doctors_carousel_widget.dart';
import '../../global_widgets/home_search_bar_widget.dart';
import '../widgets/welcome_widget.dart';
import '../../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icon/icon_top.png',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Get.theme.hintColor),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            Get.find<LaravelApiClient>().forceRefresh();
            controller.refreshHome(showMessage: true);
            Get.find<LaravelApiClient>().unForceRefresh();
          },
          child: ListView(
            primary: true,
            shrinkWrap: true,
            children: [

              SizedBox(height: 30,),
              HomeSearchBarWidget(),
              SizedBox(height: 10,),
              AddressWidget(),
              // WelcomeWidget(),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   child: Row(
              //     children: [
              //       Expanded(child: Text("Specialities".tr, style: Get.textTheme.headline5)),
              //       MaterialButton(
              //         onPressed: () {},
              //         shape: StadiumBorder(),
              //         color: Get.theme.colorScheme.secondary.withOpacity(0.1),
              //         child: Text("View All".tr, style: Get.textTheme.subtitle1),
              //         elevation: 0,
              //       ),
              //     ],
              //   ),
              // ),
              // SpecialitiesCarouselWidget(),
              // Container(
                // color: Get.theme.primaryColor,
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
           // Row(
           //        children: [
           //          Expanded(child: Text("".tr, style: Get.textTheme.headline5)),
           //          MaterialButton(
           //            onPressed: () {},
           //            shape: StadiumBorder(),
           //            // color: Get.theme.colorScheme.secondary.withOpacity(0.1),
           //            child: Text("View All".tr, style: Get.textTheme.subtitle1),
           //            elevation: 0,
           //          ),
           //        ],
           // ),


              Container(
                margin: EdgeInsets.fromLTRB(30, 60, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                              Get.toNamed(Routes.SPECIALITIES);
                          },
                          child: Container(
                            width: 165,
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.yellow,  boxShadow: kElevationToShadow[2]),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Image.asset("assets/icon/book.png"),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text("Book Consultation".tr, style: Get.textTheme.caption.merge(TextStyle(color: Colors.black, height: 0, fontWeight: FontWeight.bold , fontSize: 15))),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 165,
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.purple,  boxShadow: kElevationToShadow[4]),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Image.asset("assets/icon/homeservice1.png"),
                                  Image.asset("assets/icon/homeservice2.png")
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Home Services".tr, style: Get.textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: Colors.white, height: 0,  fontSize: 15))),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 165,
                          margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.purple,  boxShadow: kElevationToShadow[2]),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Image.asset("assets/icon/mental.png"),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Mental Health".tr, style: Get.textTheme.caption.merge(TextStyle(color: Colors.white, height: 0, fontWeight: FontWeight.bold, fontSize: 15))),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                        Container(
                          width: 165,
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.yellow ,  boxShadow: kElevationToShadow[2]),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Image.asset("assets/icon/second.png"),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Second Option".tr, style: Get.textTheme.caption.merge(TextStyle(color: Colors.black, height: 0, fontWeight: FontWeight.bold, fontSize: 15))),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),




              // RecommendedDoctorsCarouselWidget(),
              // FeaturedSpecialitiesWidget(),
            ],
          )),
    );
  }
}
