import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as ht;

import '../auth/links.dart';
import '../controllers/controller.dart';
import 'main.dart';
class CustomSearchDelegate extends SearchDelegate {
  MyC controller=Get.put(MyC());

  final List<String> searchList;
  CustomSearchDelegate(this.searchList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }


  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      // Closes the search page and returns null
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
  @override
  Widget buildResults(BuildContext context) {

    return ListView(
      children: searchList
          .where((term) => term.toLowerCase().contains(query.toLowerCase()))
          .map((term) => ListTile(
        onTap: () {
          close(context, term);
        },
        title: Container(
          width: Get.width,
          height: Get.height*0.1,
          child: Card(
            child: Row(
              children: [
                Icon(Icons.category_outlined,size: 30,color: Colors.blue),
                SizedBox(width: 10,),
                Text(term,style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold)),
              ],
            ),
            shadowColor: Colors.grey,
          ),
        ),

      )).toList(),
    );
  }

  // A method that builds suggestions for the search page
  @override
  Widget buildSuggestions(BuildContext context) {
    // Returns a list view of the suggestions that match the query
    return ListView(

      children: searchList
      // Filters the list to only include the terms that start with the query
          .where((term) => term.toLowerCase().startsWith(query.toLowerCase()))
      // Maps each term to a list tile
          .map((term) => ListTile(
        // When a list tile is tapped, it updates the query to the term
        onTap: () async {
          {
            ht.Response  response=await ht.post(
                Uri.parse(
                  "${LinkApi.category}",
                ),
                headers:
                {
                  "authorization": "Bearer ${login!.getString("login")}"          },
                body: {
                  "category":"${term}"
                }
            );
            controller.product=jsonDecode(response.body);
            Get.toNamed("/product");


          }

        },
        title: Container(
          width: Get.width,
          height: Get.height*0.1,
          child: Card(
            child: Row(
              children: [
                Icon(Icons.category_outlined,size: 35,color: Colors.cyan),
                SizedBox(width: 10,),
                Text(term,style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 25,fontWeight: FontWeight.bold)),
              ],
            ),
            shadowColor: Colors.blue,
          ),
        ),

      )).toList(),
    );
  }
}