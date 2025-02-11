import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TripDetailsScreen extends StatelessWidget {
  static const String routeName = 'TripDetailsScreen';
   TripDetailsScreen({super. key}) ;
  final List<String> tripPhotos = [
    "assets/images/trip1.png",
    "assets/images/trip2.png",
    "assets/images/trip3.png",
    "assets/images/trip4.png",
  ];

  final List<String> itinerary = [
    "Day 1: Arrival and Welcome Dinner",
    "Day 2: Ubud Exploration and Rice Terrace Trek",
    "Day 3: Temple Tour and Cooking Class",
    "Day 4: Beach Day and Water Sports",
    "Day 5: Spa Day and Sunset Cruise",
    "Day 6: Coffee Plantation Visit and Cultural Show",
    "Day 7: Free Time and Departure",
  ];

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
        title: Text("Trips", style: TextStyle(color: Colors.black, fontSize: 18.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Title
              Text("Enchanting Bali Getaway",
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),

              SizedBox(height: 10.h),

              // Trip Duration
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.calendarCheck, size: 16.sp, color: Colors.black54),
                  SizedBox(width: 8.w),
                  Text("7 Days, 6 Nights", style: TextStyle(fontSize: 16.sp)),
                ],
              ),

              SizedBox(height: 20.h),

              // Trip Photos Title
              Text("Trip Photos", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),

              SizedBox(height: 10.h),

              // Trip Photos Grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32.w,
                  mainAxisSpacing: 32.h,
                ),
                itemCount: tripPhotos.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      tripPhotos[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),

              SizedBox(height: 20.h),

              // Trip Overview Title
              Text("Trip Overview", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),

              SizedBox(height: 10.h),

              // Trip Itinerary List
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itinerary.map((day) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(day, style: TextStyle(fontSize: 16.sp)),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}