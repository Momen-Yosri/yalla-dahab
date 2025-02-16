import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/views/authentication/register/register_screen.dart';
import 'package:yalla_dahab/views/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Fade-in duration
    );

    // Tween animation from 0 (invisible) to 1 (fully visible)
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animation
    _controller.forward();

    // Navigate to home screen after a delay
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(
        context,
        RegisterScreen.routeName,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/splash_bg.png', // Ensure this path is correct
            fit: BoxFit.cover,
          ),
          
          // Animated Fade-in Text
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Text(
                "Yalla Dahab",
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}