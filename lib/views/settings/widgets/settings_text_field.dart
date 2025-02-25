import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_colors.dart';

class SettingsTextField extends StatelessWidget {
  final String label;
  final String hint;
  const SettingsTextField({super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
        SizedBox(height: 5.h),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.primary, width: 2), ),
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          ),
        ),
      ],
    );
  }
}