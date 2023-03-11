import 'package:book_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/app_cubit.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: kWhiteColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: AppCubit.get(context).primaryColor,
        accentColor: kPrimaryColor,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: kPrimaryColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme:
      GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      //dividerColor: Palette.amber500,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:kPrimaryColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primaryColorDark: kPrimaryColor,
        primarySwatch:AppCubit.get(context).primaryColor,
        accentColor: kShadowOneColorDark,
      ),
      //dividerColor: Palette.amber500,
      textTheme:
      GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
