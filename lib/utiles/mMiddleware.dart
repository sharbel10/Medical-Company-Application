import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/main.dart';


class MyM extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    if(          firstRun!.getString("onB")=="false")
    {
      return RouteSettings(name:"/login" );

    }
    return super.redirect(route);
  }

}
class MyM2 extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    if(          login!.getString("login")!=null)
    {
      return RouteSettings(name:"/ButtomNav" );

    }
    return super.redirect(route);
  }

}
