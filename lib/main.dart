import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/views/authentication/login/login_screen.dart';
import 'package:yalla_dahab/views/home/home_screen.dart';
import 'package:yalla_dahab/views/hotels/hotel_deitals_screen.dart';
import 'package:yalla_dahab/views/settings/edit_profile_screen.dart';

import 'views/authentication/register/register_screen.dart';
import 'views/hotels/all_hotels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
      initialRoute:EditProfileScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AllAvailableHotelsPage.routeName: (context) =>  AllAvailableHotelsPage(),
        HotelDetailsPage.routeName: (context) =>  HotelDetailsPage(),
        HomeScreen.routeName: (context) =>  HomeScreen(),
        EditProfileScreen.routeName: (context) =>  EditProfileScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),

      ),
        );});
}}