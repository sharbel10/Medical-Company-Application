import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../auth/links.dart';
import 'main.dart';

class SecondReport extends StatefulWidget {
  const SecondReport({super.key});

  @override
  State<SecondReport> createState() => _SecondReportState();
}

class _SecondReportState extends State<SecondReport> {
  List fun3=[];
  List a3=[
    {
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    },{
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    },{
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    },{
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    },{
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    },{
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    },{
      "id":"2",
      "order_situes":"under_dmdmdmmd",
      "pay_situes":"sddasdla",
      "order_value":"1221"
    }
  ];
  @override
  void initState() {
    getData3();
    super.initState();
  }
  getData3()async{try {
    var response = await post(Uri.parse("${LinkApi.report2}",)
        , headers:
        {
          "authorization": "Bearer ${login!.getString("login")}"}

    );
    var responseBody = jsonDecode(response.body);
    setState(() {

    });
    fun3.addAll(responseBody);
  }on Exception catch(e){
    print ("error");
  }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[300],
        title: Row(
          children: [
            Text("The second report2".tr
            ),
            Icon(Icons.content_paste_sharp,size: 17,),
          ],
        ),
      ),
      body:
      ListView.builder(

        itemBuilder: (context, i) {
          return
             Card(color: Colors.blue[200],
               child: Row(
                 children: [

                   Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(bottom: 10),
                         child: Row(
                           children: [
                             Text("the order  : ".tr,style: TextStyle(color: Colors.black,fontSize: 20),),

                             Text(fun3[i]["id"].toString(),style: TextStyle(fontSize: 20),),//fun3
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 10),
                         child: Row(
                           children: [
                             Text("order status :  ".tr,style: TextStyle(fontSize: 20),),

                             Text(fun3[i]["order_situes"],style: TextStyle(fontSize: 20)),//fun3
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 10),
                         child: Row(
                           children: [
                             Text("pay status : ".tr,style: TextStyle(fontSize: 20)),

                             Text(fun3[i]["pay_situes"],style: TextStyle(fontSize: 20)),//fun3
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 10),
                         child: Row(
                           children: [
                             Text("order value : ".tr,style: TextStyle(fontSize: 20)),
                             Text(fun3[i]["order_value"].toString(),style: TextStyle(fontSize: 20)),//fun3
                           ],
                         ),
                       )


                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 60,left: 60),
                     child: Icon(Icons.content_paste_sharp,size: 30,),
                   )
                 ],
               ),



              );


          //   } ,itemCount: controller.product.length,هي الصح

        } ,itemCount: fun3.length,//fun3


      )
    );
  }
}
