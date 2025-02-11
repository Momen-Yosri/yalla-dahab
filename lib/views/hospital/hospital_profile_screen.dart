import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HospitalProfileScreen extends StatelessWidget {
  static const String routeName = 'HospitalProfileScreen';
const HospitalProfileScreen({super. key}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Dahab Hospital", style: TextStyle(color: Colors.black, fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                "assets/images/hospital.png",
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20.h),

            // Hospital Name
            Text("St. Mary's Hospital", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 10.h),

            // Phone Number
            Row(
              children: [
                Icon(Icons.phone, size: 18.sp, color: Colors.black54),
                SizedBox(width: 10.w),
                Text("+1 (555) 123-4567", style: TextStyle(fontSize: 16.sp)),
              ],
            ),

            SizedBox(height: 10.h),

            // Get Directions Button
            Row(
              children: [
                Icon(Icons.location_on, size: 18.sp, color: Colors.black54),
                SizedBox(width: 10.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  ),
                  onPressed: () {
                    // Handle Navigation
                  },
                  child: Text("Get Directions", style: TextStyle(fontSize: 14.sp, color: Colors.white)),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Departments Title
            Text("Departments", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 10.h),

            // Departments List
            _buildDepartmentItem(FontAwesomeIcons.stethoscope, "General Medicine"),
            _buildDepartmentItem(FontAwesomeIcons.heartPulse, "Cardiology"),
            _buildDepartmentItem(FontAwesomeIcons.brain, "Neurology"),
            _buildDepartmentItem(FontAwesomeIcons.bone, "Orthopedics"),
            _buildDepartmentItem(FontAwesomeIcons.baby, "Pediatrics"),
          ],
        ),
      ),
    );
  }

  // Widget for Department List Item
  Widget _buildDepartmentItem(IconData icon, String departmentName) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: Colors.black54),
          SizedBox(width: 10.w),
          Text(departmentName, style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}