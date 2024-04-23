import 'package:untitled11/core/assets/assets.dart';

class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: "Welcome in our store ",
    image: Assets.onBoarding1,
    desc: "This application is for pharmacists",
  ),
  OnBoardingContents(
    title: "Search for any medicine and buy quantities of it",
    image: Assets.onBoarding2,
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnBoardingContents(
    title: "Register in our store to buy medicines online easily",
    image: Assets.onBoarding3,
    desc:
        "To register, click Let's get started",
  ),
];
