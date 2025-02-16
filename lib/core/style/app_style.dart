import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/core/style/app_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 24.sp),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize:MaterialStateProperty.all(Size(358.w, 40.h)) ,
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.r),
          ),
        ),
        textStyle: MaterialStateProperty.all(
         TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    )
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.sp),
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
     textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize:MaterialStateProperty.all(Size(358.w, 40.h)) ,
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.r),
          ),
        ),
       
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
  );
}
