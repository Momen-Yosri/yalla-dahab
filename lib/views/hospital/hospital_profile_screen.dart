import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/department_item.dart';

class HospitalProfileScreen extends StatelessWidget {
  static const String routeName = 'HospitalProfileScreen';
  
  const HospitalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dahab Hospital"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hospital Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  "assets/images/hospital.png",
                  width: double.infinity,
                  height: 180.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 20.h),

              // Hospital Name
              Text(
                "St. Mary's Hospital",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              SizedBox(height: 15.h),

              // Phone Number
              _buildInfoRow(
                context,
                Icons.phone,
                "+1 (555) 123-4567",
              ),

              SizedBox(height: 15.h),

              // Get Directions Row
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 24.sp,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff2B67E9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                      ),
                      onPressed: () {
                        // Handle Navigation
                      },
                      child: Text(
                        "Get Directions",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w), // Add some padding on the right
                ],
              ),

              SizedBox(height: 20.h),

              // Departments Title
              Text(
                "Departments",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              SizedBox(height: 12.h),

              // Departments List
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  DepartmentItem(
                    icon: FontAwesomeIcons.stethoscope,
                    departmentName: "General Medicine",
                  ),
                  DepartmentItem(
                    icon: FontAwesomeIcons.heartPulse,
                    departmentName: "Cardiology",
                  ),
                  DepartmentItem(
                    icon: FontAwesomeIcons.brain,
                    departmentName: "Neurology",
                  ),
                  DepartmentItem(
                    icon: FontAwesomeIcons.bone,
                    departmentName: "Orthopedics",
                  ),
                  DepartmentItem(
                    icon: FontAwesomeIcons.baby,
                    departmentName: "Pediatrics",
                  ),
                ],
              ),
              
              // Add bottom padding
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.sp,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}