import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsScreen({super.key}) ;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Settings", style: TextStyle(color: Colors.black, fontSize: 18.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            // Profile Avatar
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.blue[100],
                    child: Icon(Icons.person, size: 50.sp, color: Colors.blue),
                  ),
                  SizedBox(height: 10.h),
                  Text("John Doe", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // Personal Information Section
            sectionTitle("Personal Information"),
            settingsTile(
              icon: FontAwesomeIcons.solidHeart,
              title: "Edit Profile",
              onTap: () {},
            ),

            SizedBox(height: 10.h),

            // Dark Mode Section
            sectionTitle("Dark Mode"),
            darkModeToggle(),

            SizedBox(height: 10.h),

            // Logout Section
            settingsTile(
              icon: FontAwesomeIcons.solidHeart,
              title: "Log Out",
              subtitle: "Sign out of your account",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // Settings Tile Widget
  Widget settingsTile({required IconData icon, required String title, String? subtitle, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: 20.sp),
      title: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(fontSize: 14.sp, color: Colors.black54)) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.black54),
      onTap: onTap,
    );
  }

  // Dark Mode Toggle
  Widget darkModeToggle() {
    return ListTile(
      title: Text("Enable Dark Mode", style: TextStyle(fontSize: 16.sp)),
      trailing: Switch(
        value: isDarkMode,
        onChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}
