import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Color(0xff05C0FF) :Theme.of(context).textTheme.bodyLarge!.color,
            size: 24.sp,
          ),
          SizedBox(width: 5.w),
          Text(
            label,
            style: TextStyle(
              color: isSelected ?  Color(0xff05C0FF): Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
  }
}
