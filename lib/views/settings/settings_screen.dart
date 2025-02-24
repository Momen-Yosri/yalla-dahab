import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yalla_dahab/core/provider/app_configration.dart';
import 'package:yalla_dahab/core/style/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:yalla_dahab/views/settings/edit_profile_screen.dart';

import '../home/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsScreen({super.key});
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigurationProvider>(context);
    return Scaffold(
      appBar: AppBar(
    
        
        title: Text("Settings",
           )
      ),
      drawer: CustomDrawer(),
      body:  SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
        
              // Profile Avatar
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 75.r,
                      backgroundColor: Colors.blue[100],
                      child: Icon(Icons.person, size: 100.sp, color: Colors.blue),
                    ),
                    SizedBox(height: 10.h),
                    Text("John Doe",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
        
              SizedBox(height: 30.h),
        
              // Personal Information Section
        Text('Personal Information',style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.bold),),
              settingsTile(
                icon: FontAwesomeIcons.pencil,
                title: "Edit Profile",
                onTap: () {
                  Navigator.pushNamed(context, EditProfileScreen.routeName);
                },
              ),
        
              SizedBox(height: 10.h),
        
              // Dark Mode Section
              sectionTitle("Dark Mode"),
              darkModeToggle(provider),
        
              SizedBox(height: 10.h),
        
              // Logout Section
              settingsTile(
                icon: FontAwesomeIcons.signOutAlt,
                title: "Log Out",
                subtitle: "Sign out of your account",
                onTap: () {},
              ),
            ],
          ),
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
        child: Text(title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.sp,fontWeight: FontWeight.bold),),
      ),
    );
  }

  // Settings Tile Widget
  Widget settingsTile(
      {required IconData icon,
      required String title,
      String? subtitle,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: 20.sp),
      title: Text(title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w400),),
      subtitle: subtitle != null
          ? Text(subtitle,
              style: TextStyle(fontSize: 14.sp, color:Theme.of(context).textTheme.bodyLarge!.color))
          : null,
      trailing:
          Icon(Icons.arrow_forward_ios, size: 16.sp, color: Theme.of(context).textTheme.bodyLarge!.color),
      onTap: onTap,
    );
  }

  // Dark Mode Toggle
  Widget darkModeToggle(provider) {
    return ListTile(
      title: Text("Enable Dark Mode", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w400),),
      trailing: Switch(
        activeColor: AppColors.primary,
        value: isDarkMode,
        onChanged: (value) {
          provider.swapThemeMode();
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}
