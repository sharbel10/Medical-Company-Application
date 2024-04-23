import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled11/core/assets/assets.dart';
import 'package:untitled11/core/helpers/spacing.dart';
import 'package:untitled11/core/helpers/styles.dart';
import 'package:untitled11/core/widgets/basic_button.dart';
import 'package:untitled11/view/on_boarding/widget/on_boarding_contents.dart';

import '../main.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;
  List colors = [Color(0xffDAD3C8), Color(0xffFFE5DE), Color(0xffDCF6E6)];

  @override
  void initState() {
     firstRun!.setString("onB","false");
    super.initState();
  }

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds:200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 15,
      curve: Curves.bounceIn,
      width: _currentPage == index ? 30.w : 10.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    bool landScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (value) {

              _currentPage=value;setState(() {

              });
            },

          itemCount: contents.length,
          itemBuilder: (context, i) {
            return Container(
              height: 1000.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  // Styles.kBlueLiDark,
                  // Styles.kBlueLight,
                  GreenPalette.k1,
                  GreenPalette.k2,
                ],
              )),
              child: SafeArea(
                child: SizedBox(
                  width: landScape ? 1000.h : 1000.w,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.sm),
                      child: Column(
                        children: [
                          _currentPage == 0
                              ? FirstOnBoarding(context)
                              : _currentPage == 1
                                  ? SecondOnBoarding(context)
                                  : ThirdOnBoarding(context),
                          VSpace(Insets.m),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                              (int index) => _buildDots(index: index),
                            ),
                          ),
                          VSpace(Insets.m),
                          _currentPage + 1 == contents.length
                              ? BasicButton(
                                  title: "get started",
                                  onPressed: () {
                                    // navigate to login
                                    return Get.toNamed("/login");
                                  },
                                  titleTextStyle: TextStyles.h4.copyWith(
                                    color: Styles.colorPrimary,
                                    fontFamily: Fonts.nonSans,
                                  ),
                                  width: 135.w,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          Styles.kBasicButtonRadius)),
                                  backgroundColor: DarkPalette.k1,
                                )
                              : Offstage()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
            // print(i);
            // if (i == 0) {
            //   return buildFirstScreen(landScape, context, theme, width, 0);
            // } else if (i == 1) {
            //   return buildSecondScreen(landScape, context, theme, width, 1);
            // } else {
            //   return buildThirdScreen(landScape, context, theme, width, 2);
            // }
          },
        ),
      ),
    );
  }

  Column FirstOnBoarding(BuildContext context) {
    return Column(
      children: [
        VSpace(Insets.xxl),


         Container(
           child: Image.asset(
              Assets.onBoarding1,



        ),
         ),
        VSpace(Insets.lg),
        Text(
          "Welcome in our store",
          style: TextStyles.h4.copyWith(
              color: Styles.ColorDarkYellow, fontFamily: Fonts.nonSans,fontWeight:FontWeight.w900),
        ),
        VSpace(Insets.lg),
        Center(
          child: Text(
            "This application is for pharmacists",
            style: TextStyles.h4.copyWith(
                color: Styles.ColorDarkYellow, fontFamily: Fonts.nonSans,fontWeight:FontWeight.w900),
          ),
        ),
      ],
    );
  }

  Column SecondOnBoarding(BuildContext context) {
    return Column(
      children: [
        VSpace(Insets.xxl),


        Container(
          child: Image.asset(
            Assets.onBoarding2,



          ),
        ),
        VSpace(Insets.lg),
        Text(
          "Search for any medicine and buy quantities of it",
          style: TextStyles.h4.copyWith(
              color: Styles.ColorDarkYellow, fontFamily: Fonts.nonSans,fontWeight:FontWeight.w900),
        ),
        VSpace(Insets.lg),
        Center(
          child: Text(
            "",
            style: TextStyles.h4.copyWith(
                color: Styles.ColorDarkYellow, fontFamily: Fonts.nonSans,fontWeight:FontWeight.w900),
          ),
        ),
      ],
    );
  }

  Column ThirdOnBoarding(BuildContext context) {
    return Column(
      children: [
        VSpace(Insets.xxl),


        Container(
          child: Image.asset(
            Assets.onBoarding3,



          ),
        ),
        VSpace(Insets.lg),
        Padding(
          padding: const EdgeInsets.only(left: 41),
          child: Text(
            "Register in our store to buy medicines online easily",
            style: TextStyles.h4.copyWith(
                color: Styles.ColorDarkYellow, fontFamily: Fonts.nonSans,fontWeight:FontWeight.w900),
          ),
        ),
        VSpace(Insets.lg),
        Center(
          child: Text(
            "To register, click  get started",
            style: TextStyles.h4.copyWith(
                color: Styles.ColorDarkYellow, fontFamily: Fonts.nonSans,fontWeight:FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
