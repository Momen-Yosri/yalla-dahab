import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_dahab/views/home/home_screen.dart';

import '../register/register_screen.dart';
import '../widgets/custom_text_field.dart';
class LoginScreenView extends StatelessWidget {
  static const String routeName = "login_view";
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              "Welcome back!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              "Please enter your details to log in.",
              style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 24.h),
          CustomTextField(title: 'Email Address', labelText: 'Enter your email address'),
            SizedBox(height: 10.h),
                        CustomTextField(title: 'Password', labelText: 'Enter your password'),

            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot password?", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14.sp),),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,  HomeScreen.routeName, (Route<dynamic> route) => false);
                },
                child: Text(
                  "Login",
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(child: Text("or",style:  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),)),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/google.svg',
                    height: 24.h,
                  ),
                  SizedBox(width: 8.w),
                  Text("Continue with Google", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14.sp),),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);

                },
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w400),),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: Text(' Sign up',style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),
                ),
              ],
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}