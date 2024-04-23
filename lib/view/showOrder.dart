import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:untitled11/auth/links.dart';
import 'package:untitled11/view/orderDetails.dart';
import 'main.dart';
class MyOrders extends StatefulWidget {
  MyOrders({super.key});
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<dynamic> sharbel = [];

  Future  getorders()async {
    print("ob");
    print("${login!.getString("login")}");
    var response = await http.post(Uri.parse(LinkApi.showOrder),
        headers: <String, String>{
          'Authorization': 'Bearer ${login!.getString("login")}'
        });
    print("in");
    print(sharbel.runtimeType);
    final  data = jsonDecode(response.body) as List ;
    print(data);
    setState(() {
      sharbel = data ;
    });
    print(sharbel);
  }
  @override
  void initState() {
    super.initState();
    getorders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue[100],
        title: Row(
        children: [
        Text("MyOrders".tr,style: TextStyle(
        fontSize:23,color: Colors.black
    ),
    ),Icon(Icons.card_travel_outlined,color: Colors.black,)
    ],
    ),),
          body:  ListView.builder(itemCount: sharbel.length,itemBuilder: (context, index) {
            final currentitem = sharbel[index];
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: Get.width,
                  child: Card(
                      semanticContainer:true ,
                      /* height: Get.height*0.2,
             width: Get.width,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border:Border.all(color:Colors.black,style: BorderStyle.solid)),*/
                      child: ListTile(
                        leading: Icon(Icons.reorder,color: Colors.blue,size: 30) ,
                        title:
                        Container(margin: EdgeInsets.only(top: 13,bottom: 5),
                            child: Text("Order ${currentitem['id']}",
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                        subtitle:
                        Column(
                          children: [
                            SizedBox(height: 40,),
                            Text("pay status : ${currentitem['pay_situes']}" ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            SizedBox(height: 20,),
                            Text( "order price : ${currentitem['order_value']} \$",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        trailing:
                        Column(
                          children: [
                            Text( "${currentitem['order_situes']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green)),
                            /*Text("${currentitem['created_at']}", ),*/
                          ],
                        ),
                        onTap: () {
                          Get.to(OrderDetails(id: currentitem['id']));
                        },
                      ) ),
                ));
          },
          ),
        )  );
  }
}