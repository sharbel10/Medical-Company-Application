import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../auth/links.dart';
import 'main.dart';

class WeeklyReportes extends StatefulWidget {
  const WeeklyReportes({super.key});

  @override
  State<WeeklyReportes> createState() => _WeeklyReportesState();
}

class _WeeklyReportesState extends State<WeeklyReportes> {
  List fun1=[];
  List fun2=[];
  String m1="";
  String m2="";
  String m3="";



  @override
  void initState() {
    getData1();
    getData2();


    super.initState();
  }
  getData1()async{try {
    print("${login!.getString("login")}");
    var response = await post(Uri.parse("${LinkApi.total}",)
        , headers:
        {
          "authorization": "Bearer ${login!.getString("login")}"}

    );
    var responseBody = jsonDecode(response.body);
    setState(() {

    });
    fun1.addAll(responseBody);
  m1= fun1[0]["the total value"].toString();
  }on Exception catch(e){
    print("erorrr");
  }
  }
  getData2()async{try {
    var response = await post(Uri.parse("${LinkApi.xn}",)
        , headers:
        {
          "authorization": "Bearer ${login!.getString("login")}"}

    );
    var responseBody = jsonDecode(response.body);
    setState(() {

    });
    fun2.addAll(responseBody);
    m2=fun2[0]["the max value is  "].toString();
    m3=fun2[0]["the min value is  "].toString();

  }on Exception catch (e){
    print("errror");
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue[100],
appBar: AppBar(backgroundColor: Colors.blue[300],
  title: Row(
    children: [
      Text("Reports".tr
      ),
      Icon(Icons.content_paste_sharp,size: 17,),
    ],
  ),
),
      body:
       Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("The first report".tr,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Pacifico")),
          Container(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Text("Total order value".tr,style: TextStyle(fontSize: 18),),              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("$m1",style: TextStyle(fontSize: 18),),
                  ),//fun1
                  Divider(),
                ],
              ),
              Text("Max order value".tr,style: TextStyle(fontSize: 18)),              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Text("$m2".toString(),style: TextStyle(fontSize: 18),),
               ),//fun2
                  Divider(),
                ],
              ),
              Text("Min order value".tr,style: TextStyle(fontSize: 18)),              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("$m3".toString(),style: TextStyle(fontSize: 18),),
              ),//fun2
                  Divider(),
                ],
              ),


            ],
          ),
            height: 370,width: 500,
          ),
           Divider(height: 2,endIndent: 40,indent: 40 ,color: Colors.black,thickness: 2,),
           Padding(
             padding: const EdgeInsets.only(top: 10),
             child: Text("The second report".tr,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Pacifico")),
           ),

           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(left: 70),
               child: Stack(
                 children: [
                   Container(
                     child:        InkWell(onTap: (){
                       Get.toNamed("/secondReport");
                     },
                         child: Icon(Icons.content_paste_sharp,size: 250,)),

                   ),
                   Positioned(top: 113,left: 97,
                       child:  InkWell(onTap: (){
                         Get.toNamed("/secondReport");
                       },child:Text("Click".tr,style: TextStyle(color: Colors.black,fontSize: 25),))  )
                 ],
               ),
             ),
           )
         ],
       )


    );
  }
}
