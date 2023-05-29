import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme();

  static const white = Color(0xFFFFFFFF);
  static const transparent = Color(0xFF0000);
  static const red = Color(0xFFE94251);

  static const darkPurple = Color(0xFF3634B3);
  static const primaryPurple = Color(0xFF5450D3);
  static const primaryDisabled = Color(0xFF9896E5);
  static const backgroundPurple = Color(0xFFF5F7FF);
  static const lightPurple = Color(0xFFE0DFF7);

  static const grey00 = Color(0xFFE7EAF6);
  static const grey10 = Color(0xFFE7EAF6);
  static const grey20 = Color(0xFFD9DDEB);
  static const grey30 = Color(0xFFBDC1D1);
  static const grey50 = Color(0xFF6F7486);
  static const grey60 = Color(0xFF585D6E);
  static const grey70 = Color(0xFF2E313D);

  static const title0 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppTheme.grey70,
  );

  static const boldTitle1 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppTheme.primaryPurple,
  );

  static const title2 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.normal,
    color: AppTheme.grey70,
    fontSize: 16,
  );

  static const boldTitle2 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const title3 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.normal,
    color: AppTheme.grey70,
    fontSize: 14,
  );

  static const boldTitle3 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.bold,
    color: AppTheme.grey70,
    fontSize: 14,
  );

  static const title4= TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 3/2,
    letterSpacing: -0.2,
    color: AppTheme.primaryPurple,
  );

  static const boldSubTitle = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: AppTheme.primaryPurple,
  );

  static const subTitle = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: AppTheme.primaryPurple,
  );


  static const TextStyle body1 = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    height: 1.25,
    color: AppTheme.grey60,
  );

  static const TextStyle boldBody1 = TextStyle(
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppTheme.grey70,);

  static const body2 = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 10,
    color: AppTheme.grey50
  );

  static const body3 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
    fontSize: 8,
  );

}

// final ThemeData lightTheme = ThemeData(
//     dialogTheme: DialogTheme(
//       backgroundColor: AppTheme.transparentBlueLight,
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
//     ),
//     brightness: Brightness.light,
//     primaryColor: AppTheme.defaultBlueLight,
//     scaffoldBackgroundColor: AppTheme.backgroundBlueLight,
//     backgroundColor: AppTheme.backgroundBlueLight,
//     shadowColor: AppTheme.backgroundBlueLight,
//     appBarTheme: AppBarTheme(
//       systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: AppTheme.transparent, // <-- SEE HERE
//         statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
//         statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
//       ),
//       color: AppTheme.transparent,
//       centerTitle: true,
//       elevation: 0.0,
//       titleTextStyle: AppTheme.title1.apply(color: AppTheme.defaultTextLight),
//       iconTheme: const IconThemeData(
//         color: AppTheme.accentBlueLight,
//       ),
//     ),
//     iconTheme: const IconThemeData(
//       color: AppTheme.accentBlueLight,
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       isDense: true,
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: const BorderSide(width: 0.0, color: Colors.transparent)),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: const BorderSide(width: 0.0, color: Colors.transparent)),
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: const BorderSide(width: 0.0, color: Colors.transparent)),
//       hintStyle: AppTheme.body1.apply(color: AppTheme.defaultGreyLight2),
//       fillColor: AppTheme.white,
//       filled: true,
//     ),
//     dividerColor: AppTheme.dividerLight,
//     disabledColor: AppTheme.disabledLight1,
//     errorColor: AppTheme.warningLight,
//     cardColor: AppTheme.transparentBlueLight,
//     textTheme: TextTheme(
//       titleLarge: AppTheme.title1.apply(color: AppTheme.defaultTextLight),
//       titleMedium: AppTheme.title2.apply(color: AppTheme.defaultTextLight),
//       titleSmall: AppTheme.title3.apply(color: AppTheme.defaultTextLight),
//       bodyLarge: AppTheme.body1.apply(color: AppTheme.defaultTextLight),
//       bodyMedium: AppTheme.body2.apply(color: AppTheme.defaultTextLight),
//       bodySmall: AppTheme.body3.apply(color: AppTheme.defaultTextLight),
//     ));
