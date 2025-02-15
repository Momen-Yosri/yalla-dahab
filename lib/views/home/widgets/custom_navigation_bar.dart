import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: REdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyMedium!.color,
        borderRadius: BorderRadius.circular(30),
        
        boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
      ),
      padding: REdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, true),
          _navItem(Icons.local_hospital, false),
          _navItem(Icons.settings, false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, bool isSelected) {
    return Container(
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
    );
  }
}