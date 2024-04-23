import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../auth/links.dart';
import '../controllers/controller.dart';
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as ht;
import 'package:http/http.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List responseBoody=[];
  List ressponseBoody=[
    {"commercial_name":"setamol"},
    {"commercial_name":"hetamol"},
    {"commercial_name":"grenwood"},
    {"commercial_name":"shocomotalost"},
    {"commercial_name":"lepacrosalo"},
    {"commercial_name":"grenwood"},
    {"commercial_name":"hetamol"},
    {"commercial_name":"shocomotalost"},
    {"commercial_name":"shocomotalost"},
    {"commercial_name":"shocomotalost"},
    {"commercial_name":"shocomotalost"},
    {"commercial_name":"shocomotalost"},

  ];
  MyC controller=Get.put(MyC());

  ScrollController ?r;



  void initState() {
    getData();

    r=ScrollController();
    r!.addListener(() {
      if (r!.offset>236&&controller.scrool.value==false){

        controller.scrool.value=true;}
      else if(r!.offset<236&&controller.scrool.value==true){

        controller.scrool.value=false;
      }



    });

    super.initState();
  }


  getData()async{
    var  response= await post(Uri.parse("${LinkApi.favourite}",)
        ,headers:
        {
        "authorization": "Bearer ${login!.getString("login")}"            }

    );
      var responseBody=jsonDecode(response.body);
      setState(() {

      });
    responseBoody.addAll(responseBody);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( floatingActionButton:   GetX<MyC>(builder: (controller) {
      return Visibility(visible: controller.scrool.value,
        child: FloatingActionButton(backgroundColor: Colors.transparent,child: Icon(Icons.keyboard_double_arrow_up),
          onPressed: () {
            r!.animateTo(0, duration: Duration(microseconds: 100), curve: Curves.bounceIn);
          },

        ),
      );
    },),
        backgroundColor: Colors.white, appBar:AppBar(backgroundColor:Color(0xffD76568),title:Padding(
      padding: const EdgeInsets.only(right: 150,top: 5),
      child: Text("Your favourite".tr
          ,style: TextStyle(color: Colors.white,fontSize: 23,fontFamily: "PalanquinDark"),),
    ) ,),      body:  GridView.builder(
      controller: r,
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
      "user_show_detils":'${responseBoody[i]['commercial_name']}'

         }
      );

      controller.details=jsonDecode(response.body);
            Get.toNamed("/details");
          },
            child: Card(color: Colors.greenAccent,
              child:
              Stack(alignment: Alignment.center,children:[ Image.asset("assets/images/productPhoto.jpg",height:200,fit: BoxFit.fill,),


                Positioned(top: 50,
                  child: Text("${responseBoody[i]["commercial_name"]}",style:        //    Text("${controller.product[i]['commercial_name']}",style:

                  TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "PalanquinDark",fontSize: 18),),
                ),
             Positioned(top:10,right:10,child: Stack(alignment: Alignment.center,
               children: [
                 Container(decoration: BoxDecoration(
                   color: Color(0xffD76568),borderRadius: BorderRadius .all(Radius.circular(10))
                 ),
                     height:40,width:40),
                 Icon(Icons.favorite_border,size: 30,color: Colors.white,)
               ],
             ))
              ],
              ),
            ),
          );

          //   } ,itemCount: controller.product.length,هي الصح

        } ,itemCount: responseBoody.length,


      )
      //ListView.builder(itemCount:ressponseBoody.length ,itemBuilder: (context, i) {
      //  print(responseBoody.length);
    //    return Card(child: Row(

  //        children: [
//            Image.asset("assets/images/pas1.jpg",height: 30,),

      //      Text("${ressponseBoody[i]['medicine_name']}"),
    //      ],
  //      ),);
//      } ,),

    );  }
}
