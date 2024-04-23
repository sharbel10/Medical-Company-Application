import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as ht;
import 'package:untitled11/auth/links.dart';

import '../controllers/controller.dart';
import 'main.dart';

class Searching extends StatefulWidget {
Searching({super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {

  var searchlist= [];
  Future getdata() async{
    //var url="";
    var response = await ht.post(Uri.parse(LinkApi.search) ,
        headers: <String,String>{
          "authorization": "Bearer ${login!.getString("login")}"        });
    var data=jsonDecode(response.body);
    setState(() {
      for( int i=0;i<searchlist.length;i++){
        searchlist.add(data[i]['coommercial_name']);
      }
      print(searchlist);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Search extends SearchDelegate{
  Search({required this.list} ){
    Searchdata();
  }
  List<dynamic> list;
  Future Searchdata({searchterm=""}) async{
    var url =LinkApi.search;
    var response= await ht.post(Uri.parse(url),headers: <String,String>
    {"authorization": "Bearer ${login!.getString("login")}"},
        body:<String,String>{
          'user_serch_category_or_name': searchterm
        } );
    final body =jsonDecode(response.body);
    list.clear();
    for (int i=0;i<body.length;i++){
      list.add(body[i]);
    }
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed:
          () {
        query='';
      },
          icon:Icon(Icons.clear,color: Colors.black,) )
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back,color: Colors.black),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MyC controller=Get.put(MyC(),);

    /* var searchlist = query.isEmpty? list:list.where((element) => element.startedwith(query)).toList();*/
    List<dynamic> matched=[];
    for(var item in list){
      if(item['commercial_name'].toString().toLowerCase().contains(query.toLowerCase())|| query.isEmpty){
        matched.add(item);
      }
    }
    return ListView.builder(
        itemCount: matched.length,
        itemBuilder: (context, i) {
          final first=matched[i];
          return Card(
            child: ListTile(leading: Icon(Icons.medical_information_outlined),
              title:Text("${first['commercial_name']}") ,
              subtitle: Text("${first['manufacture_company']}"),
              trailing: Text("${first['price']}"),
              onTap: () async{
      ht.Response  response=await ht.post(Uri.parse
     ("${LinkApi.details}")
          ,headers:
         {
      "authorization": "Bearer ${login!.getString("login")}"             },body: {
      "user_show_detils":'${matched[i]['commercial_name']}'

         }
      );

      controller.details=jsonDecode(response.body);
                Get.toNamed("/details");
              },
            ),
          );
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }}