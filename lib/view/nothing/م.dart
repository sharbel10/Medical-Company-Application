import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class L extends StatefulWidget {
  const L({super.key});

  @override
  State<L> createState() => _LState();
}

class _LState extends State<L> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

        body: Container(height: 100.h,width:100.w,child: Text("ali"),),
    );
  }
}
