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
       
        title: Text("Trips"),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Title
              Text("Enchanting Bali Getaway",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24
                  .sp, fontWeight: FontWeight.w700)),

              SizedBox(height: 10.h),

              // Trip Duration
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.calendarCheck, size: 16.sp, color: Theme.of(context).textTheme.bodyLarge!.color),
                  SizedBox(width: 8.w),
                  Text("7 Days, 6 Nights", style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500)),
                ],
              ),

              SizedBox(height: 20.h),

              // Trip Photos Title
              Text("Trip Photos", style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500)),

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
              Text("Trip Overview", style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600)),

              SizedBox(height: 10.h),

              // Trip Itinerary List
              Container(
                padding: EdgeInsets.all(15.w),
               
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itinerary.map((day) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Text(day, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400)),
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