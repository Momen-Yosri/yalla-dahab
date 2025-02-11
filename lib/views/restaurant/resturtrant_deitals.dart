import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = 'RestaurantDetailScreen';
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () {},
        ),
        title: Text(
          "Gourmet Haven",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              "Our Signature Dish",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),

            // Signature Dish Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                "assets/images/bestDishImage.png", // Replace with actual image
                height: 300.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.h),

            // Dish Description
            Text(
              "Seafood Paella: A vibrant medley of fresh shrimp, mussels, and aromatic saffron rice",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),

            // View Full Menu Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Text("View Full Menu", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              ),
            ),
            SizedBox(height: 20.h),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
              "Follow Us",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white, size: 24.sp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white, size: 24.sp),
                  onPressed: () {},
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 24.sp),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Map Section
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                "assets/images/location.png", // Replace with actual map image
                height: 300.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.h),

            // Get Directions Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Text("Get Directions", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}