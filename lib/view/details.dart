import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as ht;

import '../auth/links.dart';
import '../controllers/controller.dart';
import '../controllers/controller2.dart';
import 'main.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  CartController cartcontroller = Get.put(CartController());

  MyC controller = Get.put(MyC());

  @override
  void initState() {
    controller.favourite = controller.detailsb[0]['check_favourite'];
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  List detailss = [
    {
      "scientificName": "Acetaminophen",
      "commercialName": "Tylenol",
      "category": "Analgesic",
      "manufactureCompany": "PharmaCo",
      "quantityAvailable": "100",
      "expirationDate": "DateTime(2023, 12, 31)",
      "price": '9.99'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Product p = Product(controller.details[0]['id'],
                controller.details[0]['commercial_name'],
                controller.details[0]['price'].toDouble(),);


              cartcontroller.add(p);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.blue[100],
                  content: Row(
                    children: [
                      Icon(Icons.done_outline, size: 15,),
                      Text('  ${controller.details[0]['commercial_name']}',
                        style: TextStyle(fontSize: 15, color: Colors.black),),
                      Text("  added to cart".tr,
                        style: TextStyle(fontSize: 15, color: Colors.black),)
                    ],
                  ),
                  duration: const Duration(milliseconds: 1000),
                ),
              );
            },
            child: Icon(Icons.shopping_cart)),


        appBar: AppBar(
            backgroundColor: Colors.blue[100], title:
        Padding(padding: const EdgeInsets.only(),
          child: Text("Details".tr, style: TextStyle(
              fontSize: 23, color: Colors.black
          ),),
        )),

        body: ListView(
            children: [
              Container(height: 600.h,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        "assets/images/detailsPhoto.png", fit: BoxFit.cover,
                        height: 225.h,
                      ),
                    ),
                    Positioned(top: 12, left: 12,
                      child: GetBuilder<MyC>(builder: (controller) {
                        return MaterialButton(splashColor: Colors.transparent,
                            onPressed: () async {
                              if (controller.favourite == false) {
                                controller.makeFavTrue();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(backgroundColor: Colors.blue[100],
                                        duration: Duration(milliseconds: 800),

                                        content: Row(
                                          children: [
                                            Icon(Icons.done_outline, size: 15,),
                                            Text("   Added to favorites".tr,
                                              style: TextStyle(fontSize: 15,
                                                  color: Colors.black),),
                                          ],
                                        )));

                                ht.Response response = await ht.post(
                                    Uri.parse(
                                      "${LinkApi.addFavourite}",
                                    ),
                                    headers: {
                                      "authorization": "Bearer ${login!
                                          .getString("login")}"
                                    },
                                    body: {
                                      "name": "${controller
                                          .details[0]['commercial_name']}"
                                    });
                              } else if (controller.favourite == true) {
                                controller.makeFavFalse();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(backgroundColor: Colors.blue[100],
                                        duration: Duration(milliseconds: 900),
                                        content: Row(
                                          children: [
                                            Icon(Icons.done_outline, size: 15,),

                                            Text("   Removed from favorites".tr,
                                              style: TextStyle(fontSize: 15,
                                                  color: Colors.black),),
                                          ],
                                        )));

                                ht.Response response = await ht.post(
                                    Uri.parse(
                                      "${LinkApi.deleteFavourite}",
                                    ),
                                    headers: {
                                      "authorization": "Bearer ${login!
                                          .getString("login")}"
                                    },
                                    body: {
                                      "name": "${controller
                                          .details[0]['commercial_name']}"
                                    });
//
                              }
                            },
                            child: controller.favourite == false ? Icon(
                              Icons.favorite_border, size: 30, color: Colors
                                .grey[600],)
                                : controller.favourite == true ?
                            Icon(Icons.favorite, size: 30, color: Colors.red,) :
                            Icon(Icons.favorite_border, size: 30, color: Colors
                                .red)

                        )
                        ;
                      }),
                    ),
                    Positioned(top: 215,
                      left: 37,
                      child: Text("${controller.details[0]['price']} \$",
                        style: TextStyle( //    Text("${controller.details[0]['price']}"),

                            fontSize: 25,
                            fontFamily: "Pacifico",
                            color: Colors.red
                        ),),
                    ),
                    Positioned(top: 265,
                      child: Container(height: 550.h,
                          width: 287.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))
                              , color: Colors.grey[200]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, right: 50),
                                child: Row(
                                  children: [
                                    Text("Name : ".tr,
                                      style: TextStyle( //    Text("${controller.details[0]['quantityAvailable']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                    Text("${controller
                                        .details[0]['commercial_name']}",
                                      style: TextStyle( //    Text("${controller.details[0]['commercialName']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, right: 50),
                                child: Row(
                                  children: [
                                    Text("quantity :".tr,
                                      style: TextStyle( //    Text("${controller.details[0]['quantityAvailable']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                    Text("${controller.details[0]['qauntity']
                                        .toString()}",
                                      style: TextStyle( //    Text("${controller.details[0]['quantityAvailable']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, right: 50),
                                child: Row(
                                  children: [
                                    Text("scientific_name : ".tr,
                                      style: TextStyle( //    Text("${controller.details[0]['quantityAvailable']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                    Text("${controller
                                        .details[0]['scientific_name']}",
                                      style: TextStyle( //    Text("${controller.details[0]['scientificName']}"),
                                          fontSize: 18,
                                          fontFamily: "PalanquinDark"
                                      ),),
                                  ],
                                ),
                              ), Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, right: 50),
                                child: Row(
                                  children: [
                                    Text("manufactureCompany :".tr,
                                      style: TextStyle( //    Text("${controller.details[0]['quantityAvailable']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                    Text("${controller
                                        .details[0]['manufacture_company']}",
                                      style: TextStyle( //    Text("${controller.details[0]['manufactureCompany']}"),
                                          fontSize: 18,
                                          fontFamily: "PalanquinDark"
                                      ),),
                                  ],
                                ),
                              ), Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, right: 50),
                                child:
                                Row(
                                  children: [
                                    Text("Date : ".tr,
                                      style: TextStyle( //    Text("${controller.details[0]['quantityAvailable']}"),
                                          fontSize: 23, fontFamily: "Pacifico"
                                      ),),
                                    Text(
                                      "${controller.details[0]['expiry_date']}",
                                      style: TextStyle( //    Text("${controller.details[0]['expirationDate']}")
                                          fontSize: 18,
                                          fontFamily: "PalanquinDark"
                                      ),),


                                  ],
                                ),
                              ),
                            ],
                          )


                      ),
                    )
                  ],
                ),
              )
              ,

            ]
        )
    );
  }
}


//  ListView(
//   children: [
//     Image.asset("assets/images/med.jpg"),
//     Card(
//       child: Column(
//         children: [
//           //erase 0 just name
//           Text("${controller.details[0]['price']}"),
//           Text("${controller.details[0]['category']}"),
//           //    Text("${controller.details[0]['username']}"),
//           //   Text("${controller.details[0]['email']}"),
//           //    Text("${controller.details[0]['name']}"),
//           GetBuilder<MyC>(builder: (controller) {
//             return MaterialButton(onPressed: ()async{
//               if (controller.favourite==false){
//                 controller.makeFavTrue();
//                 ht.Response response = await ht.post(
//                     Uri.parse(
//                       "${LinkApi.addFavourite}",
//                     ),
//                     headers: {
//                       "authorization": "Bearer ${login!.getString("login")}"
//                     },
//                     body: {
//                       "name"  :"${controller.details[0]['commercial_name']}"
//                     });
//               }else if(controller.favourite==true){
//                 controller.makeFavFalse();
//                  ht.Response response = await ht.post(
//                       Uri.parse(
//                        "${LinkApi.deleteFavourite}",
//                     ),
//                       headers: {
//                          "authorization": "Bearer ${login!.getString("login")}"
//                         },
//                         body: {
//                          "name"  :"${controller.details[0]['commercial_name']}"
//                         });

//               }
//             },
//                 child:controller.favourite==false ? Icon(Icons.heart_broken_outlined,size: 22,)
//                     :controller.favourite==true ?
//                 Icon(Icons.heart_broken,size: 22,):
//                 Icon(Icons.heart_broken_outlined,size: 22,)

//             )
//             ;

//           })

//         ],
//       ),
//     )
//   ],
// ),
   

