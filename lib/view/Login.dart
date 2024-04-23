import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as ht;

import '../auth/links.dart';
import '../controllers/controller.dart';
import '../core/widgets/TextField.dart';
import '../core/widgets/basic_button.dart';
import 'main.dart';

class Login extends StatelessWidget {
  Login({super.key});

  MyC controller = Get.put(MyC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formstateL,
          autovalidateMode: AutovalidateMode.always,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sh1.jpg"),
                    fit: BoxFit.cover)),
            height: 600.h,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("Welcome !",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 100,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            clipBehavior: Clip.antiAlias,

                            /*   child:ClipRRect(borderRadius: BorderRadius.circular(15),*/
                            child: Image.asset(
                              "assets/images/sh2.jpg",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(" Login to your account",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 15),
                      child: Textfield(
                          controller: controller.phoneL,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'the field is empty';
                            } else if (val!.length < 7) {
                              return 'less than 7';
                            } else if (val!.length > 15) {
                              return 'more than 15';
                            }
                            return null;
                          },
                          textInputType: TextInputType.phone,
                          icon: Icons.phone_iphone_outlined,
                          label: "Mobile Number"),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 10),
                        child: GetBuilder<MyC>(
                            init: MyC(),
                            builder: (controller) {
                              return Textfield(
                                  controller: controller.passwordL,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'the field is empty';
                                    } else if (val!.length < 8) {
                                      return 'less than 8';
                                    }

                                    return null;
                                  },
                                  textInputType: TextInputType.text,
                                  suffixHide: Padding(
                                    padding: const EdgeInsets.only(),
                                    child: InkWell(
                                      child: controller.hide == false
                                          ? Icon(
                                              Icons.visibility,
                                              size: 22,
                                              color: Colors.black,
                                            )
                                          : controller.hide == true
                                              ? Icon(
                                                  Icons.visibility_off,
                                                  size: 22,
                                                  color: Colors.black,
                                                )
                                              : Icon(
                                                  Icons.visibility,
                                                  size: 22,
                                                  color: Colors.black,
                                                ),
                                      onTap: () {
                                        if (controller.hide == true) {
                                          controller.makeFalse();
                                        } else if (controller.hide ==
                                            false) {
                                          controller.makeTrue();
                                        }
                                      },
                                    ),
                                  ),
                                  icon: Icons.key,
                                  label: "Password");
                            })),
                    SizedBox(
                      height: 10,
                    ),
             Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                       BasicButton(
                          onPressed: () async {
                            if (controller.formstateL.currentState!
                                .validate()) {
                                             ht.Response response = await ht.post(
                                                   Uri.parse(
                                                     "${LinkApi.logIn}",
                                                   ),
                                                   headers: {

                                                   },
                                                  body: {
                                                   "phone": "${controller.phoneL.text}",
                                                   "password": "${controller.passwordL.text}"
                                                 });
                                             if(response.statusCode == 200){
//
                              //                    // correct response
                              controller.phoneL.clear();
                              controller.passwordL.clear();
                                              controller.LogInResponse =
                                                 jsonDecode(response.body);
                                              print(controller.LogInResponse[0]["token"]);

                              login!.setString("login","${controller.LogInResponse[0]["token"]}" );
                              Get.offAllNamed("/ButtomNav");
                                             }
                             else if(response.statusCode == 422){
                               print("objepom'[k;lomjbhujb ljnbkjk;jn;kjn;jnbct");
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.black,
                                   duration: Duration(milliseconds: 900),content: Row(
                                     children: [
                                       Text("  Not true",style: TextStyle(fontSize: 15,color: Colors.white),),
                                     ],
                                   )));
                                       }
                                         else if(response.statusCode == 402){
print(",,,,,,,");
                                         }
                                            else if(response.statusCode == 404){
                                              print("dsfs");
                                          }else if(response.statusCode == 400){
                                              print("llll");
                                             }else if(response.statusCode == 500){
                                               print("llll");
                                             }


                            }

                          },
                          title: "Submit",
                        ),

                        SizedBox(height: 15, width: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("didn't have an account?"),
                              SizedBox(
                                width: 10,
                              ),
                              BasicButton(
                                width: 55,
                                height: 30,
                                onPressed: () {
                                  controller.verifyPhoneL = "not";
                                  controller.verifyPasswordL = "not";
                                  controller.phoneL.clear();
                                  controller.passwordL.clear();
                                  Get.offAllNamed("/signup");
                                },
                                title: "Sign Up",
                                backgroundColor: Colors.green,
                                titleTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
