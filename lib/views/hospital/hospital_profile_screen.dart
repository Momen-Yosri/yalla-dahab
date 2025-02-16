import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/department_item.dart';

class HospitalProfileScreen extends StatelessWidget {
  static const String routeName = 'HospitalProfileScreen';
const HospitalProfileScreen({super. key}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Dahab Hospital"),
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
            Text("St. Mary's Hospital", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 10.h),

            // Phone Number
            Row(
              children: [
                Icon(Icons.phone, size: 18.sp, color:Theme.of(context).textTheme.bodyLarge!.color),
                SizedBox(width: 10.w),
                Text("+1 (555) 123-4567", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400)),
              ],
            ),

            SizedBox(height: 10.h),

            // Get Directions Button
            Row(
              children: [
                Icon(Icons.location_on, size: 24.sp, color:Theme.of(context).textTheme.bodyLarge!.color),
                SizedBox(width: 10.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2B67E9),
                    maximumSize: Size(150.w, 30.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
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
            Text("Departments", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 12.h),

            // Departments List
            DepartmentItem(icon:FontAwesomeIcons.stethoscope, departmentName: "General Medicine"),
            DepartmentItem(icon:FontAwesomeIcons.heartPulse,  departmentName:"Cardiology"),
            DepartmentItem(icon:FontAwesomeIcons.brain,  departmentName:"Neurology"),
            DepartmentItem(icon:FontAwesomeIcons.bone,  departmentName:"Orthopedics"),
            DepartmentItem(icon:FontAwesomeIcons.baby,  departmentName:"Pediatrics"),
          ],
        ),
      ),
    );
  }

  // Widget for Department List Item
  
}