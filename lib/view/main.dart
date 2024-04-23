import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled11/view/Login.dart';
import 'package:untitled11/view/product.dart';
import 'package:untitled11/view/secondreport.dart';
import 'package:untitled11/view/showOrder.dart';
import 'package:untitled11/view/weeklyReports.dart';

import '../controllers/cart.dart';
import '../controllers/controller.dart';
import '../core/helpers/lang.dart';
import '../utiles/mMiddleware.dart';
import 'SignUp.dart';
import 'favourite.dart';
import 'home.dart';
import 'buttomNav.dart';
import 'nothing/م.dart';
import 'details.dart';
import 'on_boarding/onboarding_screen.dart';
import 'splash.dart';
import 'nothing/nothing.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

SharedPreferences? firstRun;
SharedPreferences? login;
SharedPreferences? localization;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  firstRun=await SharedPreferences.getInstance();
  login=await SharedPreferences.getInstance();
  localization=await SharedPreferences.getInstance();
  //firstRun!.setString("onB", "yes");
  runApp( Pharmacy());
}

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  @override

  @override
  Widget build(BuildContext context) {
    MyC controller=Get.put(MyC());
    return ScreenUtilInit(
      designSize: const Size(360, 600),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          translations: Lang(),
           locale:controller.initLang ,
getPages: [
  GetPage(name: "/onBoarding", page:()=> OnBoardingScreen(),middlewares: [MyM()]), GetPage(name: "/login", page:()=> Login(),middlewares: [MyM2()]),
  GetPage(name: "/home", page:()=>Home()),  GetPage(name: "/signup", page:()=> SignUp(),)
  ,GetPage(name: "/ButtomNav", page:()=>ButtomNav()),GetPage(name: "/product", page:()=>Product()),
  GetPage(name: "/details", page:()=>Details()),GetPage(name: "/favourite", page:()=>Favourite()),GetPage(name: "/wR", page:()=>WeeklyReportes()),
  GetPage(name: "/secondReport", page:()=>SecondReport()),  GetPage(name: "/cart", page:()=>CartPage()),
  GetPage(name: "/showOrder", page:()=>MyOrders()),

],
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child:Splash(),
    );
  }
}

class Lang implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":
    {
      "cat":"التصنيفات",
      "welcome":"أهلا بكم في متجرنا",
      "home":" الرئيسية",
      "favourite":"المفضلة",
      "Search Medicine":"ابحث هنا",
      "Products":"المنتجات",
      "   Removed from favorites":"   الازالة من المفضلة",
      "   Added to favorites":"   الاضافة الى المفضلة",
      "Details":"التفاصيل  ",
      "quantity :":"الكمية   :   ",
      "Name : ":"الاسم :  ",
      "category :":"الصنف  : ",
          "scientific_name : ":"الاسم العلمي: ",
          "manufactureCompany :":" المصنع :  ",
      "Date : ":"التاريخ : ",
      "Your favourite":"مفضلتك",
      "c6":" اختر اللغة",

      "c3": "اختر اللغة               ",
      "c4":"اللغة",
      "c2":"الإنكليزية",
      "c1":"العربية",
   "logout":"   تسجيل الخروج              ",
      "report":"التقارير الاسبوعية       ",
      "Reports":" التقارير   ",
      "The first report":" التقرير الأول :",
      "The second report":" التقرير الثاني :   ",
      "The second report2":" التقرير الثاني    ",

      "Click":"انقر  ",
      "Total order value":"إجمالي قيمة الطلب",
      "Max order value":"أعلى قيمة طلبية",
      "Min order value":"أقل قيمة طلبية",
"  added to cart":"   تمت اضافته للسلة  ",
      "my order":"طلبيتي",
      "Cart":"طلبيتك  ",
      "MyOrders":"طلبياتي  ",
      "My Orders":"طلبياتي                  ",
          "orderDetails":"تفاصيل الطلبية  ",
      "name:":"الاسم  : ",
      "quantity:":"الكمية  : ",
      "price:":"ٍِالسعر  : ",
      "company:":"الشركة  : ",
      "the order  : ":"الطلب : ",
      "order status :  ":"حالة الطلبية : ",
      "pay status : ":"حالة الدفع : ",
      "order value : ":"قيمة الطلبية : "
    },
    "en":
    {
      "cat":"Categories",
      "welcome":"Welcome to our store",
      "home":"home"
      ,"favourite":"favourite",
      "Search Medicine":"Search Medicine",
      "Products":"Products",
     "    Removed from favorites":"Removed from favorites",
      "   Added to favorites":"   Added to favorites",
      "Details":"Details",
      "quantity :":"quantity : ",
      "Name : ":"name : ",
      "category :":"Category : ",
      "scientific_name : ":"scientificName : ",
      "manufactureCompany :":"manufactureCompany : ",
      "Date : ":"Date : ",

      "Your favourite":"Your favourite",
      "c6":"choose language",

      "c3":"choose language",
      "c4":"language",
      "c2":"English",
      "c1":"Arabic",
      "logout":"logout           ",
      "report":"Weekly reports ",
      "Reports":"Reports   ",
          "The first report":"The first report:",
  "The second report":"The second report:   ",
  "Click":"Click",
      "Total order value":"Total order value",
      "Max order value":"Max order value",
      "Min order value":"Min order value",
      "The second report2":"The second report   ",
      "  added to cart":"  added to cart",
"my order":"my order",
      "Cart":"your order  ",
      "MyOrders":"My Orders  ",
      "My Orders":"My Orders        ",
          "orderDetails":"orderDetails   ",
  "name:":"name  : ",
  "quantity:":"quantity  : ",
  "price:":"ٍِprice  : ",
  "company:":"company  : ",
      "the order  : ":"the order :  ",
      "order status :  ":"order status :  ",
      "pay status : ":"pay status : ",
      "order value : ":"order value : "

    },
  };

}