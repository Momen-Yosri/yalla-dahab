import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/core/style/app_colors.dart';
import 'package:yalla_dahab/views/home/home_screen.dart';

import '../../hospital/all_hospitals_screen.dart';
import '../../settings/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).textTheme.bodyMedium!.color, 
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.r, // Responsive size
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40.sp, color: Colors.blue),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.home,
              text: "Home",
              iconColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.local_hospital,
              text: "Hospitals",
              iconColor: Colors.red,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, HospitalListScreen.routeName);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              text: "Settings",
              iconColor: Colors.grey,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String text, required Color iconColor, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 24.sp),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        onTap: onTap,
      ),
    );
  }
}
