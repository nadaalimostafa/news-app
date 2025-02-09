import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'AppColors.dart';

class AppStyle{
  static  ThemeData lightTheme = ThemeData(
   scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w400,
        fontSize: 22.sp ,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 27.sp,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r)
        )
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
    ),
    textTheme:  TextTheme(
      bodyMedium: TextStyle(
        fontSize: 22.sp,
        color: AppColors.secondaryColor,
      ),
       bodyLarge: TextStyle(
        fontSize: 24.sp,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primaryColor
      ),
    )
  );
}