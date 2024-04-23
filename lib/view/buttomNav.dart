import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controllers/cart.dart';
import '../controllers/controller.dart';
import '../core/widgets/basic_button.dart';
import 'favourite.dart';
import 'home.dart';

class ButtomNav extends StatelessWidget {
   ButtomNav  ({super.key});
  MyC controller = Get.put(MyC());
   List<Widget> l = [
     Home(),
     //screeon in buttomnav
   Favourite(),
     CartPage()
   ];
  @override
  Widget build(BuildContext context) {
    return GetX<MyC>(builder: (controller)
    {
      return Scaffold(
          bottomNavigationBar:
          ConvexAppBar(
            activeColor: Colors.white,
            backgroundColor: Color(0xffD76568),
            height: 45,
            elevation: 2,
            initialActiveIndex: controller.currentIndex.value,
            onTap: (val) {
              controller.currentIndex.value = val;

            },
            style: TabStyle.flip,
            items: [
              TabItem(
                 fontFamily:"Pacifico" , title: "home".tr, icon: Icon( Icons.home,color: Colors.blue,)),
              TabItem(
                  fontFamily:"Pacifico",   title: "favourite".tr,
                  icon: Icon(Icons.favorite,color: Colors.blue,)),
              TabItem(
                  fontFamily:"Pacifico",   title: "my order".tr,
                  icon: Icon(Icons.shopping_cart,color: Colors.blue,)),
            ],
          ),


          body:
          Container(child: l.elementAt(controller.currentIndex.value))
      );
    }
    );
  }
}
