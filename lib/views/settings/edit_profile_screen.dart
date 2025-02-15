import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/widgets/custom_radio_button.dart';
import 'widgets/settings_text_field.dart';



class EditProfileScreen extends StatefulWidget 
{  static const String routeName = "EditProfileScreen";

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
String selectedGender = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),

              CircleAvatar(
                radius: 75.r,
                backgroundColor: Colors.blue[100],
                child: Icon(Icons.person, size: 100.sp, color: Colors.blue),
              ),

              SizedBox(height: 20.h),

              SettingsTextField(label: "Full Name", hint: "Enter your full name"),

              SizedBox(height: 15.h),

              SettingsTextField(label: "Username", hint: "Enter your username"),

              SizedBox(height: 15.h),

              SettingsTextField(label: "Email",hint:  "Enter your email address"),

              SizedBox(height: 15.h),

              
              SettingsTextField(label: "Phone Number", hint: "Enter your phone number"),

              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Gender", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500),),
              ),

               Row(
      children: [
        CustomRadioButton(
          value: "Male",
          selectedGender: selectedGender,  // Pass current selection
          onChanged: (value) {
            setState(() {
              selectedGender = value;  // Update selection
            });
          },
        ),
        CustomRadioButton(
          value: "Female",
          selectedGender: selectedGender,  // Pass current selection
          onChanged: (value) {
            setState(() {
              selectedGender = value;  // Update selection
            });
          },
        ),
      ],
    ),

              SizedBox(height: 30.h),

              // Save Changes Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                  onPressed: () {
                    // Handle Save Logic
                  },
                  child: Text("Save Changes", style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // TextField Widget

  // Radio Button Widget
}
