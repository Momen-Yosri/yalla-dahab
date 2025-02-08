import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";
   const LoginScreen({super.key});
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
              children: <Widget>[
                Text('Gender:'),
                SizedBox(width: 10.w),
                Radio(value: 'Male', groupValue: 'Gender', onChanged: (value) {}),
                Text('Male'),
                Radio(value: 'Female', groupValue: 'Gender', onChanged: (value) {}),
                Text('Female'),
              ],
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                // Handle sign up logic
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10.h),
            Text('or'),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                // Handle Google sign up logic
              },
              child: Row(
                children: [ SvgPicture.asset('assets/svg/google.svg'),
                SizedBox(width: 8.w),
                  Text('Continue with Google'),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
              },
              child: Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}