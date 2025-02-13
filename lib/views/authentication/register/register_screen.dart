import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_dahab/views/home/widgets/custom_radio_button.dart';

import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    String selectedGender = "Male"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding:  REdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Create Your Account',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
             Text(
              'Join our community and start your journey!',
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.normal),
            ),
          CustomTextField(title: 'Full Name', labelText: 'Enter your full name'),
            SizedBox(height: 10.h),
          CustomTextField(title: 'Email Address', labelText: 'Enter your email address'),
            SizedBox(height: 10.h),
          CustomTextField(title: 'Password', labelText: 'Enter a strong password'),
            SizedBox(height: 10.h ),
            
            SizedBox(height: 10.h),
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
            SizedBox(height: 20.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign up logic
                },
                child: Text('Sign Up'),
              ),
            ),
            SizedBox(height: 10.h),
            Center(child: Text('or')),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                // Handle Google sign up logic
              },
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/google.svg',
                      height: 24.h,
                    ),
                    SizedBox(width: 8.w),
                    Text("Continue with Google", style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
            ),
            SizedBox(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                  },
                  child: Text(' Log in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}