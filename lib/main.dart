import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/core/provider/app_configration.dart';
import 'package:yalla_dahab/views/authentication/register/register_screen.dart';
import 'package:yalla_dahab/views/home/home_screen.dart';
import 'package:yalla_dahab/views/hospital/hospital_profile_screen.dart';
import 'package:yalla_dahab/views/hotels/hotel_deitals_screen.dart';
import 'package:yalla_dahab/views/settings/edit_profile_screen.dart';
import 'core/style/app_style.dart';
import 'views/authentication/login/login_screen.dart';
import 'views/hotels/all_hotels.dart';
import 'views/restaurant/resturtrant_deitals.dart';
import 'views/settings/settings_screen.dart';
import 'views/trips/trip_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigurationProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigurationProvider>(context);

    return ScreenUtilInit(
        designSize: const Size(412, 917),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: LoginScreenView.routeName,
            routes: {
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              LoginScreenView.routeName: (context) => const LoginScreenView(),
              HomeScreen.routeName: (context) => HomeScreen(),
              AllAvailableHotelsPage.routeName: (context) =>
                  AllAvailableHotelsPage(),
              HotelDetailsPage.routeName: (context) => HotelDetailsPage(),
              EditProfileScreen.routeName: (context) => EditProfileScreen(),
              HospitalProfileScreen.routeName: (context) =>
                  HospitalProfileScreen(),
              TripDetailsScreen.routeName: (context) => TripDetailsScreen(),
              RestaurantDetailScreen.routeName: (context) =>
                  RestaurantDetailScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen(),
            },
            theme: MyThemeData.lightTheme,
            darkTheme: MyThemeData.darkTheme,
            themeMode: provider.currentThemeMode,
           
          );
        });
  }
}
