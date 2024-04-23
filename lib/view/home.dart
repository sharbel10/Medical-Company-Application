import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled11/view/search.dart';
import 'package:untitled11/view/searchhh.dart';
import '../../auth/links.dart';
import 'package:http/http.dart'as ht;

import '../../core/assets/assets.dart';
import '../controllers/controller.dart';
import '../core/helpers/styles.dart';
import '../core/widgets/basic_button.dart';
import 'main.dart';

class Home extends StatelessWidget {
  var searchlist= [];


  Home({super.key});

  GlobalKey<ScaffoldState>opendDrawer=GlobalKey();
  MyC controller=Get.put(MyC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(key:opendDrawer ,appBar:
    AppBar(backgroundColor: Colors.transparent,elevation: 0,clipBehavior: Clip.none,toolbarHeight: 0,),
      drawer: InkWell(
        onTap:(){
          opendDrawer.currentState!.openDrawer();
        },
        child: Drawer(backgroundColor: Colors.blue[100],
          child: Padding(
            padding:  EdgeInsets.all(30),
            child: ListView(
              children: [

          InkWell(splashFactory:  NoSplash.splashFactory,highlightColor: Colors.transparent,splashColor: Colors.transparent,onTap: (){
            Get.defaultDialog(
                title: "c6".tr,
                titleStyle: TextStyle(fontWeight: FontWeight.bold),
                middleText: "c4".tr,
                textCancel: "c2".tr,
                textConfirm: "c1".tr,
                onCancel: (){
                  print(localization!.getString("lang") );

                  controller.changelang("en");
                },
                onConfirm: (){
               print(localization!.getString("lang") );
                  controller.changelang("ar");
                }

            );
          },
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Padding(
                  padding: const EdgeInsets.only(),
                  child: Icon(Icons.language_rounded,size: 28,),
                ),
                  Text("c3".tr,style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
                 ///
                ///
                ///
                InkWell(splashFactory:  NoSplash.splashFactory,highlightColor: Colors.transparent,splashColor: Colors.transparent,
                onTap: ()async{

                    login!.remove("login");

                    ht.Response response = await ht.post(
                      Uri.parse(
                        "${LinkApi.logout}",
                      ),
                      headers: {
                        "authorization": "Bearer ${login!.getString("login")}"
                      },
                    );

                    Get.offNamed("/login");

                },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(Icons.logout,size: 30,),
                      ),
                        Text("logout".tr,style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                InkWell(splashFactory:  NoSplash.splashFactory,highlightColor: Colors.transparent,splashColor: Colors.transparent,
                  onTap: (){
Get.toNamed("/wR");

                },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Padding(
                        padding: const EdgeInsets.only(),
                        child: Icon(Icons.content_paste_sharp,size: 30,),
                      ),
                        Text("report".tr,style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                InkWell(splashFactory:  NoSplash.splashFactory,highlightColor: Colors.transparent,splashColor: Colors.transparent,
                  onTap: (){
                    Get.toNamed("showOrder");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Padding(
                        padding: const EdgeInsets.only(),
                        child: Icon(Icons.card_travel_outlined,size: 30,),
                      ),
                        Text("My Orders".tr,style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      backgroundColor:Colors.blue[100],
      body: ListView(
        children: [
          Container(
            height: 230,
            child: Stack(
              children: [
                Container(height: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
                  ),
                ),


                   //    Positioned(  right: 300,top: 0,
                     //  child: Padding(
                   //    paddi ng: const EdgeInsets.only(left: 120,top: 12),
                 //      child: MaterialButton(
              ///         onPressed:()async
            //           {
//opendDrawer.currentState!.openDrawer();


              //         },child: Icon(Icons.menu_outlined,size: 25,)
   // ),)),
        //       Positioned(
        //          right: 30,top: 5,
        //          child: IconButton(onPressed: (){
        //            Get.toNamed("showOrder");
        //          }, icon:Icon(Icons.integration_instructions_outlined,size: 40,))),
                Positioned(
                    left: 21,top: 100,right: 35,
                    child: Text("welcome".tr,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico"),
                    )
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40,right:40),
                      child: TextFormField(onTap: (){
                       showSearch(context: context, delegate: Search(list: searchlist));
                        //shrbl search

                      },readOnly: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search,color: Colors.grey),
                            hintText: "Search Medicine".tr,
                            hintStyle: TextStyle(fontSize: 13,color: Colors.grey),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 12,right: 38),
                child: Text("cat".tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,fontFamily: "Pacifico"),),
              ),
              IconButton(
                onPressed: () {
                  List<String> searchlist2=[
                    "Oral",
                    "Injectable",
                    "infusion",
                    "serums",
                    "External use",
                    "antiseptics",
                    "Streilizers",
                  ];
                  showSearch(context: context, delegate:CustomSearchDelegate(searchlist2));
                },
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(Icons.manage_search,color: Colors.black,size: 40),
                ),
              ),

            ],
          ),
         Container(height: 150,margin: EdgeInsets.only(top: 20),
           child: ListView(scrollDirection: Axis.horizontal ,
              children: [

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomCategory(name: "Oral", color: Colors.blue),

                      CustomCategory(name: "Injectable", color: Colors.red),
                      CustomCategory(name: "infusion", color: Colors.yellow),
                      CustomCategory(name: "serums", color: Colors.green),
                      CustomCategory(name: "External use", color: Colors.brown),
                      CustomCategory(name: "antiseptics", color: Colors.white),
                      CustomCategory(name: "Streilizers", color: Colors.white),


                    ],
                  ),

              ],
            ),
         ),
                    Image.asset("${Assets.homeButtom}"
                    ),




        ],
      ),
    );
  }
}











////////////////////////////
//import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:http/http.dart';
//import 'package:http/http.dart'as ht;
//import 'package:shared_preferences/shared_preferences.dart';

//import '../controllers/controller.dart';
///import 'product.dart';
//import 'main.dart';

//class Home extends StatefulWidget {
  // Home({super.key});

//  @override
  //State<Home> createState() => _HomeState();
//}

//class _HomeState extends State<Home> {
 // MyC controller=Get.put(MyC());

//  @override
 // Widget build(BuildContext context) {
  //  return Scaffold(
   //   appBar: AppBar(title: Text("home",),

    //  ),

//body:



//Column(
 // children: [


  //  MaterialButton(onPressed: ()async{
  //   var  response=await get(Uri.parse("http://192.168.43.154:8000/api/ali",)

  //    );
   //   var responseBoody=jsonDecode(response.body);
   //   print (response);
   //   print(responseBoody);

 // },color:Colors.green)

 //   ,
  // MaterialButton(onPressed: ()async{
    // ht.Response  response=await ht.post(Uri.parse("http://192.168.43.154:8000/api/getcatigory",)
      //  ,headers:
     //    {
   //       "authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzAxMjQxNzI5LCJleHAiOjE3MDEyNDUzMjksIm5iZiI6MTcwMTI0MTcyOSwianRpIjoiVTd4QmxQakRpNVhiV1hodSIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.zvub21cnFKZCVSUEYdr0eujnj-R9b1No9R6pbfwHrvA"
   //     },body: {
  //       "category":"Mr."
  //      }
  //  );
  //   controller.responseBody=jsonDecode(response.body);
///
 ///     Get.to(Gat());
///
///
 ///   },child: Text("11111"),color: Colors.black,
 ///   )
///




    //,
  //  ,
//        MaterialButton(
//
//     onPressed:(){
//    login!.remove("login");
//    Get.offNamed("/login");
//    } ,child: Text("logout"),
//
//
//    ),


 // ],
//)
   // );
 // }
//}
