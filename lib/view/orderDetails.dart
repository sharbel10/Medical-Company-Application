import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({required this.id});
  final  id;
  @override
  State<OrderDetails> createState() => _OrderDetailsState(id:'$id');
}

class _OrderDetailsState extends State<OrderDetails> {
  _OrderDetailsState({required this.id}){}
  late final String id;

  @override
  var sharbel=[];
  Future  getorders()async {
    print("ob");
    var response = await http.post(Uri.parse('http://192.168.1.11:8000/api/user_select_show_order'),
        headers: <String, String>{
          'Authorization': 'Bearer ${login!.getString("login")}'
        },
        body: {
          'id': id
        }
    );
    print("in");
    print(sharbel.runtimeType);
    final  data = jsonDecode(response.body) as List ;/*
    print(data);*/
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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(   appBar: AppBar(backgroundColor: Colors.blue[100],
        title: Row(
          children: [
            Text("orderDetails".tr,style: TextStyle(
                fontSize:23,color: Colors.black
            ),
            ),Icon(Icons.card_travel_outlined,color: Colors.black,)
          ],
        ),),
          body:   GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,crossAxisSpacing: 1,),
              itemCount: sharbel.length,itemBuilder: (context, index) {
                final currentitem = sharbel[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 100,
                      width: Get.width,
                      child: Card(child:
                      ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.border_color, color: Colors.blue,size: 25),
                            SizedBox(width: 9,),
                            Text("Order ${currentitem?['pivot']['order_id']}",
                              style: TextStyle(color: Colors.blue,fontSize: 25),),
                            SizedBox(height: 60,)
                          ],
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("name:".tr,style: TextStyle(color: Colors.black,fontSize: 22)),
                                  Text("${currentitem?['commercial_name']}",
                                    style: TextStyle(color: Colors.black,fontSize: 22),),
                                ],
                              ),
                              SizedBox(height: 6,),
                              Row(
                                children: [
                                  Text("quantity:".tr,style: TextStyle(color: Colors.black,fontSize: 22)),

                                  Text("${currentitem?['pivot']['qauntity']}",
                                    style:TextStyle(color: Colors.black,fontSize:22) ,),
                                ],
                              ),
                              SizedBox(height: 12,),
                              Row(
                                children: [
                                  Text("price:".tr,style: TextStyle(color: Colors.black,fontSize: 22)),

                                  Text("${currentitem?['price']} \$",
                                      style:TextStyle(color: Colors.black,fontSize: 22)),
                                ],
                              ),
                              SizedBox(height: 12,)
                              ,Row(
                                children: [
                                  Text("company:".tr,style: TextStyle(color: Colors.black,fontSize: 22)),
                                  Text("${currentitem?['manufacture_company']}",
                                      style: TextStyle(color: Colors.black,fontSize: 22)),
                                ],
                              ),
                            ],
                          ),
                        ),tileColor: Colors.grey.shade300,))),
                );
              }
          ) ),
    );
  }
}