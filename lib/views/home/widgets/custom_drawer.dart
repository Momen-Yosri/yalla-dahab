import 'package:flutter/material.dart';
import 'package:yalla_dahab/views/home/home_screen.dart';

import '../../hospital/hospital_profile_screen.dart';
import '../../settings/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text("Welcome!", style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.red),
            title: Text("Hospitals"),
            onTap: () {
              Navigator.pushReplacementNamed(context, HospitalProfileScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}