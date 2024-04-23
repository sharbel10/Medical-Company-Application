import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/controller.dart';

class Textfield extends StatefulWidget {
   Textfield({this.textInputType,this. controller,this.suffixHide,super.key,required this.label,required this.icon,this.validator});
 TextInputType ? textInputType;
String label;
IconData icon;
   Widget ?suffixHide;
TextEditingController? controller ;
    String? Function(String?  )? validator;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  MyC controller=Get.put(MyC());

  @override
  Widget build(BuildContext context) {
    return
       TextFormField(

        validator:widget.validator ,
        controller: widget.controller,

        obscureText:controller.hide,
        keyboardType:widget.textInputType ,

        decoration: InputDecoration(suffixIcon:widget.suffixHide,border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black,width: 10)),
            label: Row(
              children: [
                Icon(widget.icon ,size: 20),
                SizedBox(width: 10),
                Text("${widget.label}",style:TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontSize: 20),),
              ],
            )),





    );
  }
}
