import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled11/auth/links.dart';
import '../view/main.dart';
import 'controller2.dart';
class CartPage extends StatelessWidget {

  CartPage({Key? key}) : super(key: key);
  CartController cartController= Get.put(CartController(),permanent: true);
  @override
  Future senddata() async{
    List<Map<String, dynamic >> listOfMaps=[];
    for (int i=0;i<cartController.cart.length;i++){
      listOfMaps.add(
        {'id':cartController.cart[i].drug.id,
          'qauntity':cartController.cart[i].count.value
        },
      );
    }
    print(listOfMaps);
    var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${login!.getString("login")}'
    };
    var request = http.Request('POST', Uri.parse('${LinkApi.cart}/api/user_be_order?'));    request.body = json.encode({
      "medicine": listOfMaps
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Sd");
 print(response.stream.bytesToString().toString());
//  ScaffoldMessenger..showSnackBar(  SnackBar(
//    content: Text('the order have been sent'),
//    duration: const Duration(seconds: 2),
//  ),);

    }
    else {
      print(response.reasonPhrase);
      print("df");
    }

  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        floatingActionButton: FloatingActionButton(onPressed:() {

        },child: IconButton(
          icon: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send),
              ],
            ),
          ),
          tooltip: 'Send order',
          onPressed: () {
            senddata();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Your order have been sent'),
                duration: const Duration(seconds: 2),
              ),
            );

          },
        ), ),
        appBar: AppBar(backgroundColor: Colors.blue[100],
          title: Row(
            children: [
              Text("Cart".tr,style: TextStyle(
                  fontSize:23,color: Colors.black
              ),
              ),Icon(Icons.shopping_cart,color: Colors.black,)
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("Images/background.jpg"),fit: BoxFit.cover)),
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => ListView.builder(
                    itemCount: cartController.cart.length,
                    itemBuilder: (context, index) {
                      // Get the current product
                      final cartItem = cartController.cart[index];
                      return   Card(
                        semanticContainer: true,
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading:Icon(Icons.medical_services_outlined,color: Colors.blue.shade500,size: 40),
                          title: Text(cartItem.drug.name,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                          subtitle:
                          Text(' ${cartItem.drug.price.obs}'),
                          trailing: Column(
                            children: [
                              Obx(() => Container(
                                height: 22,
                                width: 120,
                                decoration: BoxDecoration(color: Colors.blue.shade50,borderRadius: BorderRadius.circular(8)),
                                child:   Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: (){

                                        cartController.decrease(cartController.cart[index].drug);
                                        print("object");
                                      },

                                      child: Container(height: 30,
                                        child: Padding(
                                          padding: const EdgeInsets.only(),
                                          child: Center(child: Icon(Icons.minimize_outlined, size: 23)),
                                        ),
                                      ),
                                    ),
                                    Text(cartController.cart[index].count.value.obs.toString()),
                                    GestureDetector(
                                      onTap: (){
                                        cartController.increase(cartController.cart[index].drug);
                                      },
                                      child: Icon(Icons.add),
                                    ),

                                  ],

                                ),

                              ),
                              ),
                              SizedBox(height: 10,),
                              GestureDetector(
                                  onTap:() {
                                    cartController.delete(cartController.cart[index].drug);
                                  },
                                  child: Container(
                                    child: Icon(Icons.delete,color: Colors.grey.shade500,),
                                  ))
                            ],
                          ),

                        ),
                      );
                    },
                  ),
                  ),
                ),
              ),

            ],

          ),
        ),

      ),
    );

  }}