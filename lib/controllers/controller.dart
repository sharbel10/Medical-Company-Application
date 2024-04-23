import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled11/view/main.dart';

class MyC extends GetxController{
TextEditingController  phoneS=TextEditingController();
  TextEditingController passwordS=TextEditingController();
TextEditingController  phoneL=TextEditingController();
TextEditingController passwordL=TextEditingController();
GlobalKey<FormState>formstateS=GlobalKey();
GlobalKey<FormState>formstateL=GlobalKey();
RxInt currentIndex=0.obs;
RxBool scrool=false.obs;

List product=[];
List details=[];
List detailsb=[];

String ?acceptSignUp;
String? acceptLogIn;
List signUpResponse=[];
List LogInResponse=[];
List responseBody=[];

String verifyPhoneS="not";
String verifyPasswordS="not";
String verifyPhoneL="not";
String verifyPasswordL="not";
  bool hide=false;
  void makeTrue(){
    hide=true;
    update();

  }
  void makeFalse(){
    hide=false;
    update();

  }

bool favourite=false;
void makeFavFalse(){
  favourite=false;

  update();

}
void makeFavTrue(){
  favourite=true;
  update();

}

Locale? initLang=localization!.getString("lang")==null?Get.deviceLocale:Locale(localization!.getString("lang")!);
void changelang(String codelang){
  Locale locale=Locale(codelang);
  localization!.setString("lang", codelang);
  Get.updateLocale(locale);
}
}






