import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/helper.dart';
import '../../../../common/ui.dart';
import '../../../models/setting_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/settings_service.dart';
import '../../root/controllers/root_controller.dart';
import '../controllers/auth_controller.dart';

class StartView extends GetView<AuthController> {
  final Setting _settings = Get.find<SettingsService>().setting.value;

  @override
  Widget build(BuildContext context) {
    controller.loginFormKey = new GlobalKey<FormState>();
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
        body: Form(
          key: controller.loginFormKey,
          child: ListView(
            primary: true,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 200, 50, 0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icon/icon.png',
                          ),
                          SizedBox(height: 50),
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            color: Colors.yellow,
                            minWidth: 250,
                            height: 50,
                            elevation: 10,
                            child: Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10,
                              children: [
                                Text(
                                  "Login".tr,
                                  style: Get.textTheme.subtitle1.merge(TextStyle(color: Colors.black, fontSize: 22)),
                                ),
                              ],
                            ),
                            shape: StadiumBorder(),
                          ),
                          SizedBox(height: 50),
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            color: Colors.purple,
                            minWidth: 250,
                            height: 50,
                            elevation: 10,
                            child: Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10,
                              children: [
                                Text(
                                  "Create Account".tr,
                                  style: Get.textTheme.subtitle1.merge(TextStyle(color: Colors.white, fontSize: 20)),
                                ),
                              ],
                            ),
                            shape: StadiumBorder(),
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){

                                  },
                                  child: Image.asset("assets/icon/google.png", height: 100,),

                                ),
                              ),
                          //     Expanded(
                          //       child: GestureDetector(
                          //         onTap: (){
                          //           controller.loginWithFacebook();
                          //         },
                          //         child: Image.asset("assets/icon/facebook.png", height: 100,),
                          //       ),
                          //     ),
                            ],
                          //
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}







