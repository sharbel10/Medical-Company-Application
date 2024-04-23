import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart'as ht;

import '../auth/links.dart';
import '../controllers/controller.dart';
import '../core/widgets/TextField.dart';
import '../core/widgets/basic_button.dart';
import 'main.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  MyC controller=Get.put(MyC());
List a=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: controller.formstateS,autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(

          child: Container(            height: 600.h,

            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/sh1.jpg"),fit: BoxFit.cover)),

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
                              style: TextStyle(color: Colors.black,fontSize: 30, fontWeight: FontWeight.bold)),
                          SizedBox(width: 40,),
                          Container(
                            height: 100,
                            width:130 ,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                            clipBehavior: Clip.antiAlias,

                            /*   child:ClipRRect(borderRadius: BorderRadius.circular(15),*/
                            child: Image.asset("assets/images/sh2.jpg",fit: BoxFit.cover,),)

                        ],



                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(" Creat new account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ),


                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 15),
                      //phone
                      child:

    Textfield(validator:(val) {

                          if(val!.isEmpty) {
                            return 'the field is empty';
                          }else if (val!.length<7){
                            return 'less than 7';
                          }else if (val!.length>15){
                            return 'more than 15';
                          }
                          return null;

                      } ,

                          controller: controller.phoneS,
                          textInputType: TextInputType.phone, icon: Icons.phone_iphone_outlined, label: "Mobile Number"),

                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 10),
                        child:   Textfield(validator:(val) {

                            if(val!.isEmpty) {
                              return 'the field is empty';

                            }else if (val!.length<8){

                              return 'less than 8';
                            }
                            return null;

                          } ,controller: controller.passwordS,
                              textInputType: TextInputType.text, suffixHide:Padding(
                            padding: const EdgeInsets.only(),
                            child:GetBuilder<MyC>(builder: (controller) {
                              return  InkWell(
                              child:controller.hide==false ? Icon(Icons.visibility,size: 22,color: Colors.black,)
                                  :controller.hide==true ?
                              Icon(Icons.visibility_off,size: 22,color: Colors.black,):
                              Icon(Icons.visibility,size: 22,color: Colors.black,)



                              ,onTap: (){
                              if (controller.hide==true){
                                controller.makeFalse();
                              }else if(controller.hide==false){
                                controller.makeTrue();

                              }
                            },

  );})
                          ),
                              icon: Icons.key, label: "Password")

                    ),

                    SizedBox(height: 10,),


                       Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //submit
                          BasicButton(
                            onPressed: () async {
                              if (controller.formstateS.currentState!
                                  .validate()) {
                           ht.Response response = await ht.post(
                                Uri.parse(
                                  "${LinkApi.signUp}",
                                ),
                             headers: {
                                },
                               body: {
                                "phone": "${controller.phoneS.text}",
                                "password": "${controller.passwordS.text}"
                                });
                              if(response.statusCode == 200){

                                // correct response

                            controller.phoneS.clear();
                                 controller.passwordS.clear();

                                 controller.signUpResponse =
                                  jsonDecode(response.body);
                                Get.offAllNamed("/login");


                           //     } else if(response.statusCode == 400){
                                //error

                               }else if(
                              response.statusCode == 500
                              ){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.black,
                                    duration: Duration(milliseconds: 900),content: Row(
                                      children: [
                                        Text("   The account already exists",style: TextStyle(fontSize: 15,color: Colors.white),),
                                      ],
                                    )));
                                print("a,,,,,lmdkwmedl");
                              }

                                 }
                            },
                            title: "Submit",
                          ),


                          SizedBox(height: 15,
                              width: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("already have an account?"),
                                SizedBox(width: 10,),
                                BasicButton(width: 55,height: 30,
                                  onPressed:(){
                                    controller.verifyPhoneS="not";
                                    controller.verifyPasswordS="not";
                                    controller.phoneS.clear();
                                    controller.passwordS.clear();
                                    Get.offAllNamed("/login");
                                  } , title:"Login",backgroundColor: Colors.green,titleTextStyle:
                                  TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
