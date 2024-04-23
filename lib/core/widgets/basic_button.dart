import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as ht;
import 'package:untitled11/auth/links.dart';

import 'package:untitled11/core/helpers/styles.dart';

import '../../controllers/controller.dart';
import '../../view/main.dart';
import '../../view/product.dart';


class BasicButton extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function onPressed;
  final double? width;
  final double? height;
  final Widget? iconWidget;
  final BorderRadius? borderRadius;
  BasicButton(
      {super.key,
      this.titleTextStyle,
      this.width,
        this.height,
      this.iconWidget,
      this.borderColor,
      this.backgroundColor,
      required this.title,
      this.borderRadius,
      required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(Styles.kBasicButtonRadius),
        child: InkWell(
            borderRadius: BorderRadius.circular(Styles.kBasicButtonRadius),
            onTap: () {
              onPressed();
            },
            child: Container(
                width: width ?? 105.w,
                height: height ?? 36.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor ??
                          (backgroundColor ??
                              Styles.buttons2Color), //                   <--- border color
                      width: 0.4.w,
                    ),
                    color: backgroundColor ?? Styles.buttons2Color,
                    borderRadius: borderRadius ??
                        const BorderRadius.all(
                            Radius.circular(Styles.kBasicButtonRadius))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconWidget ?? const SizedBox.shrink(),
                    Text(title, style: titleTextStyle ?? TextStyles.title1),
                  ],
                ))));
  }
}
class CustomCategory extends StatelessWidget {
  Color color;
  String name;

  CustomCategory({super.key,required this.name,required this.color });
  MyC controller=Get.put(MyC(),permanent: true);

  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.only(right: 15),
      child:
         Column(
          children: [
            Container(
              height: 100,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom:Radius.circular(55),top:Radius.circular(55)),
                color:color,
              ),
              child: IconButton(onPressed: ()async{
                  ht.Response  response=await ht.post(
                      Uri.parse(
                       "${LinkApi.category}",
                    ),
                  headers:
                  {
                "authorization": "Bearer ${login!.getString("login")}"          },
                     body: {
                  "category":"$name"
                    }
                  );
                 controller.product=jsonDecode(response.body);
                Get.toNamed("/product");


              }, icon: Icon(Icons.medical_services_outlined,size: 40,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text("$name",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),

    );
  }
}
/////

