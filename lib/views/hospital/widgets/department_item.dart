import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartmentItem extends StatelessWidget {
  IconData icon;
   String departmentName;
   DepartmentItem({super.key,required this.icon,required this.departmentName}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 24.sp, color:Theme.of(context).textTheme.bodyLarge!.color),
          SizedBox(width: 10.w),
          Text(departmentName, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}