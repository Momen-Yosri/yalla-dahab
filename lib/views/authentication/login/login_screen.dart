import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your full name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Text('Gender:'),
                SizedBox(width: 10),
                Radio(value: 'Male', groupValue: 'Gender', onChanged: (value) {}),
                Text('Male'),
                Radio(value: 'Female', groupValue: 'Gender', onChanged: (value) {}),
                Text('Female'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up logic
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10),
            Text('or'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Google sign up logic
              },
              child: Text('Sign up with Gmail'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to login screen
              },
              child: Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}