import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:textstyle_extensions/textstyle_extensions.dart';
//import 'package:google_fonts/google_fonts.dart';

class Styles {
  ///multi-selection icon background
  static const kMultiSelectionNonPressableIconBackground = Color(0xffAEE80A);
  static const kMultiSelectionPressableIconBackground = Color(0xffB9BCB2);
  static const kSentMessageDesignColor = Color.fromRGBO(210, 242, 168, 1);

  /// contact dialog gradient

  static const contactDialogGrad1 = Color.fromRGBO(0, 0, 0, 0);
  static const contactDialogGrad2 = Color.fromRGBO(0, 0, 0, 0.32);
  static const contactDialogGrad3 = Color.fromRGBO(0, 0, 0, 0.5);

  /// Blue Pallete
  static const kBlueDark = Color(0xff03254c);
  static const kBlueMeDark = Color(0xff1167b1);
  static const kBlueLiDark = Color(0xff187bcd);
  static const kBlueDeDark = Color(0xff0244a1);
  static const kBlueMeLight = Color(0xff2a9df4);
  static const kBlueDeLight = Color(0xff3333ff);
  static const kBlueLight = Color(0xffd0efff);

  static const kBlue1 = Color(0xff22d7e9);
  static const kBlue2 = Color(0xff0c48eb);
  static const kBlue3 = Color(0xff6e8ad7);
  static const kBlue4 = Color(0xff76d7e2);
  static const kBlue5 = Color(0xff224db4);
  static const kBlue6 = Color(0xff3e61d8);
  static const kBlue7 = Color(0xff4b81e4);
  static const kBlue8 = Color(0xff1e68e5);

  //static Color headerColor2 = const Color(0xff224db4);
  static Color headerColor2 = const Color(0xff49ccb8);
  //static Color headerColor1 = const Color(0xff4b81e4);
  static Color headerColor1 = const Color(0xffc1eee8);
  static Color headerColor3 = const Color(0xffff99ca);
  static Color inProgressStatus = Color(0xff49ccb8);
  static Color sentStatus = const Color(0xfffcd682);
  static Color mediumStatus = const Color(0xffaec1ff);
  static Color cancelStatus = const Color(0xffff8b8b);
  static Color normalStatus = const Color(0xff90ffec);
  static Color highStatus = const Color(0xffd7c06e);

  /// custom dialig evaluation

  static const double kDialogBorderRadius = 40;
  static const double kDialogTopPadding = 35;
  static const double kDialogPadding = 20;
  static const double kAvatarRadius = 45;
  static const double kBasicButtonRadius = 10;
  static List<Color> kDefaultRainbowColors = const [
    Color(0xff49ccb8)
  ];

  /// return Screen
  final RegExp emailValidatorRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  final phoneRegExp = RegExp(r"\(?\d+\)?[-.\s]?\d+[-.\s]?\d+");

  /// App Settings
  static Color get colorPrimary => Color(0xFF82C8D5);

  static Color get secondaryColor => Color(0xFFFFDFA0);

  // header widget
  // static Color headerColor1 = const Color(0xFF007bff);
  // static Color headerColor2 = const Color(0xFFe83e8c);
  // static Color headerColor3 = const Color(0xFFe83e8c);

  /// font
  static const FontFamilyBlack = 'Poppins-Black';
  static const FontFamilyBold = 'Poppins-Bold';
  static const FontFamilySemiBold = 'Poppins-SemiBold';
  static const FontFamilyLight = 'Poppins-Light';
  static const FontFamilyPoppinsMedium = 'Poppins-Medium';
  static const FontFamilyMontserrat = 'Montserrat';
  static const FontFamily = 'Poppins';
  static const FontFamilyMontserratBlack = 'Montserrat_Black';
  static const FontFamilyMontserratMedium = 'Montserrat-Medium';
  static const FontFamilyPoppins = 'Poppins';
  static const FontFamilyMontserratSemiBold = 'Montserrat-SemiBold';

  static double textSizeScaleFactor = 1;

  static double fontSize7 = 7 * textSizeScaleFactor;
  static double fontSize8 = 8 * textSizeScaleFactor;
  static double fontSize10 = 10 * textSizeScaleFactor;
  static double fontSize11 = 11 * textSizeScaleFactor;
  static double fontSize12 = 12 * textSizeScaleFactor;
  static double fontSize13 = 13 * textSizeScaleFactor;
  static double fontSize14 = 14 * textSizeScaleFactor;
  static double fontSize15 = 15 * textSizeScaleFactor;
  static double fontSize16 = 16 * textSizeScaleFactor;
  static double fontSize17 = 17 * textSizeScaleFactor;
  static double fontSize18 = 18 * textSizeScaleFactor;
  static double fontSize20 = 20 * textSizeScaleFactor;
  static double fontSize23 = 23 * textSizeScaleFactor;
  static double fontSize25 = 25 * textSizeScaleFactor;
  static double fontSize30 = 30 * textSizeScaleFactor;
  static double fontSize35 = 35 * textSizeScaleFactor;
  static double fontSize40 = 40 * textSizeScaleFactor;
  static double fontSize88 = 88 * textSizeScaleFactor;

  static double fontSizeCustom(double size) => size * textSizeScaleFactor;

  static const FontColorWhite = Color(0xFFFFFFFF);
  static const FontColorGray = Color(0xFFBCBCBC);
  static const FontColorDarkGray = Color(0xFF8D9595);
  static const FontColorLiteGray = Color(0xFFCBCFD3);
  static const FontColorDarkGray1 = Color(0xFF9A9A9A);
  static const FontColorLiteGray2 = Color(0xFFDEDEDE);

  static const FontColorBlack = Color(0xFF494949);
  static const ColorYellow = Color(0xFFFFDFA0);
  static const ColorDarkYellow = Color(0xFFC0C48A);
  static const FontColorNiagara = Color(0xFF0FB0A2);
  static const FontColorOrange = Color(0xFFE8833B);
  static const FontColorOrangeLite = Color(0xFFFFA337);
  static const FontColorYellow = Color(0xFFEAC170);
  static const FontColorBlueTurquoise = Color(0xFF13A7C8);
  static const buttonsColor = Color(0xff3333ff);
  static const buttons2Color = Color(0xFF007bff);
  static const onBoardingBackgroundColor = Color(0xFF007bff);
  static TextStyle get fontStyle =>
      TextStyle(fontFamily: Styles.FontFamilyMontserrat);

  static get mediumFontStyle => fontStyle.copyWith(fontWeight: FontWeight.w500);

  static get semiBoldFontStyle =>
      fontStyle.copyWith(fontWeight: FontWeight.w600);

  static TextStyle formInputTextStyle = fontStyle.copyWith(
      fontWeight: FontWeight.w200, fontFamily: Styles.FontFamily);
  static InputDecoration formInputDecoration = InputDecoration(
      border: InputBorder.none, filled: true, fillColor: Colors.white);

  static InputDecoration borderlessRoundedFieldDecoration(
          {double radius = 40}) =>
      formInputDecoration.copyWith(
          border: InputBorder.none,
          focusedBorder: roundedTransparentBorder(radius: radius),
          enabledBorder: roundedTransparentBorder(radius: radius),
          errorBorder: roundedTransparentBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          disabledBorder: roundedTransparentBorder(radius: radius),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white);

  static InputDecoration borderedRoundedFieldDecoration({double radius = 40}) =>
      formInputDecoration.copyWith(
          border: roundedOutlineInputBorder(radius: radius),
          focusedBorder: roundedOutlineInputBorder(radius: radius),
          enabledBorder: roundedOutlineInputBorder(radius: radius),
          errorBorder: roundedOutlineInputBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: roundedOutlineInputBorder(radius: radius)
              .copyWith(borderSide: BorderSide(color: Colors.red)),
          disabledBorder: roundedOutlineInputBorder(radius: radius),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white);

  static InputBorder roundedTransparentBorder({double radius = 40}) =>
      OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(radius),
      );

  static InputBorder roundedOutlineInputBorder({double radius = 40}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: Styles.colorPrimary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      );

  static const ColorUpdateDialog = Color.fromRGBO(34, 34, 34, 0.94);
  static const ColorToglleButton = Color.fromRGBO(83, 78, 86, 1);
}

class Durations {
  static const Duration fastest = Duration(milliseconds: 150);

  static const Duration fast = Duration(milliseconds: 250);

  static const Duration medium = Duration(milliseconds: 350);

  static const Duration slow = Duration(milliseconds: 700);
}

class Fonts {
  static const String lato = "Lato";

  static const String quicksand = "Quicksand";

  static const String emoji = "OpenSansEmoji";
  static const String raleway = "Raleway";
  static const String fraunces = "Fraunces";
  static const montserrat = 'Montserrat';
  static const nonSans = 'NotoSansArabic';
  static const tajwal = 'Tajwal';
  static const cairo = 'Cairo';
  static const String janna = "Janna";
}

class DarkPalette {
  static const k1 = Color(0xff284b64);
  //static const k8 = Color(0xff1b313e);
  static const k2 = Color(0xffcbd0d3);
  static const k3 = Color(0xff8c9c9c);
  static const k4 = Color(0xff748188);
  static const k5 = Color(0xff445a64);
  static const k6 = Color(0xff3d4d55);
  static const k7 = Color(0xff344c54);
}

class AppColor {
  static const background = Color(0xfffbfffe);
  //static const k8 = Color(0xff1b313e);
  static const title = Color(0xff284b64);
  //static const appBar = Color(0xff445a64);
  static const appBar = Color(0xff32c6b0);
  static const subTitle = Color(0xff5c5c5c);
  static const containerColor = Color(0xffffffff);
  static const k5 = Color(0xff445a64);
  static const k6 = Color(0xff3d4d55);
  static const k7 = Color(0xff344c54);
}

class GreenPalette {
  static const k1 = Color(0xff32c6b0);
  static const k2 = Color(0xff33c4b3);
  static const k3 = Color(0xffc1eee8);
  static const k4 = Color(0xff49ccb8);
  static const k5 = Color(0xff3cccb4);
}

class PageBreaks {
  static double get LargePhone => 550;

  static double get TabletPortrait => 768;

  static double get TabletLandscape => 1024;

  static double get Desktop => 1440;
}

class Insets {
  static double gutterScale = 1;

  static double scale = 2.w;

  /// Dynamic insets, may get scaled with the device size
  static double mGutter = m * gutterScale;

  static double lGutter = l * gutterScale;

  static const double defaultSm = 6 * 1;
  static const double defaultXs = 2 * 1;
  static const double defaultM = 12 * 1;
  static const double defaultL = 24 * 1;
  static const double defaultXL = 36 * 1;
  static const double defaultXXL = 64 * 1;

  static double xs = 2 * scale;

  static double sm = 6 * scale;

  static double m = 12 * scale;

  static double xm = 18 * scale;

  static double l = 24 * scale;

  static double xl = 36 * scale;

  static double xxl = 64 * scale;

  static double offsetScale = 1.w;

  // Regular paddings

  static double get med => 12 * scale;

  static double get lg => 16 * scale;

  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class FontSizes {
  static double scale = 2.sp;

  static double s11 = 11 * scale;

  static double s12 = 12 * scale;

  static double s14 = 14 * scale;

  static double s16 = 16 * scale;

  static double s18 = 18 * scale;

  static double get s8 => 9 * scale;

  static double get s10 => 10 * scale;

  static double get s24 => 24 * scale;

  static double get s48 => 48 * scale;
}

class Sizes {
  static double hitScale = 1.w;

  static double hit = 40 * hitScale;

  static const double iconMed = 20;

  static double sideBarSm = 150 * hitScale;

  static double sideBarMed = 200 * hitScale;

  static double sideBarLg = 290 * hitScale;
}

class TextStyles {
  static const TextStyle lato = TextStyle(
    fontFamily: Fonts.lato,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    height: 1,
    fontFamilyFallback: [
      Fonts.emoji,
    ],
  );

  static const TextStyle quicksand = TextStyle(
    fontFamily: Fonts.quicksand,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    fontFamilyFallback: [
      Fonts.emoji,
    ],
  );

  static const TextStyle montserrat = TextStyle(
    fontFamily: Fonts.montserrat,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    height: 1,
  );

  static TextStyle get T1 =>
      montserrat.bold.size(FontSizes.s14).letterSpace(.7);

  static TextStyle get T2 =>
      montserrat.bold.size(FontSizes.s12).letterSpace(.4);

  static TextStyle get H1 => montserrat.bold.size(FontSizes.s14);

  static TextStyle get H2 => montserrat.bold.size(FontSizes.s12);

  static TextStyle get Body1 => montserrat.size(FontSizes.s14);

  static TextStyle get Body2 => montserrat.size(FontSizes.s12);

  static TextStyle get Body3 => montserrat.size(FontSizes.s11);

  static TextStyle get Callout =>
      quicksand.size(FontSizes.s14).letterSpace(1.75.h);

  static TextStyle get CalloutFocus => Callout.bold;

  static TextStyle get Btn =>
      quicksand.bold.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get BtnSelected =>
      quicksand.size(FontSizes.s14).letterSpace(1.75);

  static TextStyle get Footnote => quicksand.bold.size(FontSizes.s11);

  static TextStyle get Caption => lato.size(FontSizes.s11).letterSpace(.3);
  static const TextStyle raleway = TextStyle(
      fontFamily: Fonts.tajwal, fontWeight:FontWeight.bold, height: 1);
  static const TextStyle fraunces = TextStyle(
      fontFamily: Fonts.fraunces, fontWeight: FontWeight.bold, height: 1);

  static TextStyle get h1 => montserrat.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: FontSizes.s48,
      //letterSpacing: -1,
      height: 1.17);

  static TextStyle get h2 => h1.copyWith(
      fontSize: FontSizes.s24,
      //letterSpacing: 1,
      height: 1.16,
      fontWeight: FontWeight.bold);

  static TextStyle get h2_5 =>
      h1.copyWith(fontSize: FontSizes.s18, letterSpacing: -.5, height: 1.16);

  static TextStyle get h3 =>
      h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);

  static TextStyle get h4 =>
      h1.copyWith(fontSize: FontSizes.s10, letterSpacing: -.05, height: 1.29,fontFamily: Fonts.tajwal);

  static TextStyle get h5 =>
      h1.copyWith(fontSize: FontSizes.s8, letterSpacing: -.05, height: 1.29);

  static TextStyle get title1 => raleway.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s10, height: 1,color: Colors.white);

  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.w500, fontSize: FontSizes.s10, height: 1.36);

  static TextStyle get body1 => raleway.copyWith(
      fontWeight: FontWeight.normal, fontSize: FontSizes.s14, height: 1.71);

  static TextStyle get body2 =>
      body1.copyWith(fontSize: FontSizes.s12, height: 1.5, letterSpacing: .2);

  static TextStyle get body3 => body1.copyWith(
      fontSize: FontSizes.s12, height: 1.5, fontWeight: FontWeight.bold);

  static TextStyle get callout1 => raleway.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: FontSizes.s12,
      height: 1.17,
      letterSpacing: .5);

  static TextStyle get callout2 =>
      callout1.copyWith(fontSize: FontSizes.s10, height: 1, letterSpacing: .25);

  static TextStyle get caption => raleway.copyWith(
      fontWeight: FontWeight.w800, fontSize: FontSizes.s11, height: 1.36);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 10),
      ];

  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];

  static bool enabled = true;

  static double get mRadius => 8;

  static List<BoxShadow> m(Color color, [double opacity = 0]) {
    return enabled
        ? [
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: mRadius,
              spreadRadius: mRadius / 2,
              offset: Offset(1, 0),
            ),
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: mRadius / 2,
              spreadRadius: mRadius / 4,
              offset: Offset(1, 0),
            )
          ]
        : const <BoxShadow>[];
  }
}

class Corners {
  static const double btn = s5;
  static const double sm = 10;
  static const double dialog = 12;

  /// Xs
  static const double s3 = 3;

  static BorderRadius get s3Border => BorderRadius.all(s3Radius);

  static Radius get s3Radius => Radius.circular(s3);

  /// Small
  static const double s5 = 5;

  static BorderRadius get s5Border => BorderRadius.all(s5Radius);

  static Radius get s5Radius => Radius.circular(s5);

  /// Medium
  static const double s8 = 8;

  static const BorderRadius s8Border = BorderRadius.all(s8Radius);

  static const Radius s8Radius = Radius.circular(s8);

  /// Large
  static const double s10 = 10;

  static BorderRadius get s10Border => BorderRadius.all(s10Radius);

  static Radius get s10Radius => Radius.circular(s10);
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);
  static const double med = 15;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 20;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);
  static const double xl = 30;
  static const double xxl = 60;
}

class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}
