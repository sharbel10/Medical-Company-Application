import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as ht;

import '../auth/links.dart';
import '../controllers/controller.dart';
import 'main.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  ScrollController ?c;

  @override

  void initState() {
    c=ScrollController();
    c!.addListener(() {
      if (c!.offset>236&&controller.scrool.value==false){

        controller.scrool.value=true;}
        else if(c!.offset<236&&controller.scrool.value==true){

        controller.scrool.value=false;
      }



    });

    super.initState();
  }
  MyC controller=Get.put(MyC());
  List producttest=[{
    "name":"setamol",
    "price":r"$2"
  },
    {
      "name":"dfbdfbdfjrtjrtr",
      "price":r"$23"
    },
    {
      "name":"meckrukfk",
      "price":r"$5"
    },
    {
      "name":"kokobekatin",
      "price":r"$15"
    },
    {
      "name":"markonof",
      "price":r"$12"
    },
    {
      "name":"setamol",
      "price":r"$125"
    },
    {
      "name":"setamol",
      "price":r"$125"
    },
    {
      "name":"setamol",
      "price":r"$125"
    },
    {
      "name":"setamol",
      "price":r"$125"
    },
    {
      "name":"setamol",
      "price":r"$125"
    },
    {
      "name":"setamol",
      "price":r"$125"
    }, {
      "name":"setamol",
      "price":r"$125"
    }, {
      "name":"setamol",
      "price":r"$125"
    }, {
      "name":"setamol",
      "price":r"$125"
    }, {
      "name":"setamol",
      "price":r"$125"
    },{
      "name":"setamol",
      "price":r"$125"
    },{
      "name":"setamol",
      "price":r"$125"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(  floatingActionButton:   GetX<MyC>(builder: (controller) {
      return Visibility(visible: controller.scrool.value,
        child: Padding(
          padding: const EdgeInsets.only(right: 300),
          child: FloatingActionButton(backgroundColor: Colors.transparent,child: Icon(Icons.keyboard_double_arrow_up),
            onPressed: () {
              c!.animateTo(0, duration: Duration(microseconds: 100), curve: Curves.bounceIn);
            },

          ),
        ),
      );
    },),

        backgroundColor: Colors.white, appBar:AppBar(backgroundColor:Color(0xffD76568),
        title:
        Padding(
      padding: const EdgeInsets.only(),
      child: Text("Products".tr,style: TextStyle(fontSize: 17,fontFamily: "PalanquinDark"),),
    ) ,),

        body:
         GridView.builder(
          controller: c,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,crossAxisSpacing: 0,mainAxisSpacing: 0,
          ),
          itemBuilder: (context, i) {
            return InkWell(onTap: ()async{
     ht.Response  response=await ht.post(Uri.parse
     ("${LinkApi.details}")
          ,headers:
         {
      "authorization": "Bearer ${login!.getString("login")}"             },body: {
      "user_show_detils":'${controller.product[i]['commercial_name']}'
         }
      );
     String a=controller.product[i]['commercial_name'];
print("${login!.getString("login")}");
                    controller.details=jsonDecode(response.body);
     ht.Response  responsee=await ht.post(Uri.parse
       ("${LinkApi.detailsb}")
         ,headers:
         {
           "authorization": "Bearer ${login!.getString("login")}"             },body: {
           "user_show_detils":'$a'

         }
     );

    controller.detailsb=jsonDecode(responsee.body);


     Get.toNamed("/details");
            },
              child: Card(color: Colors.greenAccent,
                child:
                Stack(alignment: Alignment.center,children:[ Image.asset("assets/images/productPhoto.jpg",height:200,fit: BoxFit.fill,),


                  Positioned(top: 40,
                    child:           Text("${controller.product[i]['commercial_name']}",style:

                    TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "PalanquinDark",fontSize: 18),),
                  ),
                  Positioned(bottom: 0,left: 0,
                    child:            Text("${controller.product[i]['price']}",style:

                    TextStyle(color: Color(0xffD76568),fontWeight: FontWeight.w800,fontFamily: "PalanquinDark",fontSize: 18),),
                  ),





                ],
                ),
              ),
            );

            //   } ,itemCount: controller.product.length,هي الصح

          } ,itemCount: controller.product.length,


        )
,
    );
  }
}


//   GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2
//   ),
//   itemBuilder: (context, i) {
//     return InkWell(onTap: ()async{
//
//       ht.Response  response=await ht.post(Uri.parse
//      ("${LinkApi.details}")
//           ,headers:
//          {
//       "authorization": "Bearer ${login!.getString("login")}"             },body: {
//       "details":'${controller.product[i]['commercial_name']}'
//
//          }
//       );
//
//       controller.details=jsonDecode(response.body);
//    Get.toNamed("/details");
//
//
//     },
//       child: Card(color: Colors.greenAccent,
//         child: Row(
//           children: [
//             Expanded(child: Image.asset("assets/images/med.jpg",height:200,fit: BoxFit.fill,)),
//
//             Expanded(
//               child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("${controller.product[i]['commercial_name']}",style:
//                   TextStyle(color: Colors.green,fontWeight: FontWeight.w900),),
//                   Text("${controller.product[i]['id']}",style:
//                   TextStyle(color: Colors.red,fontWeight: FontWeight.w900),),
//                 ],
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//
//   } ,itemCount: controller.product.length,
//
//
//   )