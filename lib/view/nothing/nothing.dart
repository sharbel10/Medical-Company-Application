import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled11/controllers/controller.dart';
class LogIn extends StatelessWidget {
   LogIn({super.key});
  MyC controller=Get.put(MyC());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black26,),body:

      Column(
        children: [GetBuilder<MyC>(init: MyC(),builder: (controller) {
    if (controller.hide==false){
      return Image.asset("images/pas1.jpg",height: 150,width: 150,);

    }
    else if(controller.hide==true){
      return Image.asset("images/pas2.jpg",height: 170,width: 170,);
    }
    else return Text("");
    }
        ),


          Padding(
            padding: const EdgeInsets.all(15),
            child:
                GetBuilder<MyC>(init: MyC(),builder: (controller) {
                  return TextField(obscureText:controller.hide ,
                    decoration:  InputDecoration(
                        suffix: IconButton(onPressed: (){
if (controller.hide==true){
  controller.makeFalse();
}else if(controller.hide==false){
  controller.makeTrue();
}
                        },icon: Icon(Icons.hide_source)),
                        label: Text("password")
                    ),
                  );

                },)


          ),
        ],
      )

      ,
    );
  }
}

class R extends StatefulWidget {
  const R({super.key});

  @override
  State<R> createState() => _RState();
}

class _RState extends State<R> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(clipBehavior: Clip.none,


          children:[ Container(color: Color(0xffDDE1EA),),Positioned(child: Image.asset("images/onBoarding2.jpg",height: 270,),top: 0,)
            ,
            Positioned(bottom: 0,left: 0,right: 0,top: 260,
              child:   Container(decoration: BoxDecoration(
                  color: Color(0xffF1E0C7),


                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft:Radius.circular(40) )

              ),
                child: Column(
                  children: [

                  ],
                ),

              ),
            )
          ]
          ,

        )

    );
  }
}
