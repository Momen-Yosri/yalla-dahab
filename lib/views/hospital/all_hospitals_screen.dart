import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yalla_dahab/views/hospital/hospital_profile_screen.dart';

import '../home/widgets/custom_drawer.dart';

class HospitalListScreen extends StatelessWidget {
  static const String routeName = "HospitalsScreen";

  final List<Map<String, String>> hospitals = List.generate(
    6,
    (index) => {
      "name": "Dahab Hospital",
      "image":'assets/svg/hospital-svgrepo-com.svg',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hospitals",
          
        ),
       
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: ListView.builder(
          itemCount: hospitals.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HospitalProfileScreen.routeName);
                },
                child: Row(
                  children: [
                    ClipRRect(
                      child: SvgPicture.asset(
                        hospitals[index]["image"]!,
                        width: 60.w,
                        height: 60.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      hospitals[index]["name"]!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
