import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
   HomeScreen({super.key});
  final List<Map<String, dynamic>> popularPlaces = [
    {
      "name": "Retac Qunay ",
      "image": "assets/images/hotel_list1.jpg",
      "rating": 4.8
    },
    {
      "name": "Alley Palace",
      "image": "assets/images/hotel_list2.jpg",
      "rating": 4.1
    },
    {
      "name": "Sheraton",
      "image": "assets/images/hotel_list3.jpg",
      "rating": 4.3
    },
    {
      "name": "semiramis",
      "image": "assets/images/hotel_list4.jpg",
      "rating": 4.5
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            // User Profile
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  SizedBox(height: 8.h),
                  Text("Hi, (User name)", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.clear, color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Category Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _categoryButton(Icons.grid_view, "All", isSelected: true),
                _categoryButton(Icons.hotel, "Hotels"),
                _categoryButton(Icons.restaurant, "Restaurants"),
                _categoryButton(Icons.beach_access, "Tourism"),
              ],
            ),

            SizedBox(height: 16),

            // Popular Places Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Places", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View all", style: TextStyle(fontSize: 14, color: Colors.blue)),
              ],
            ),

            SizedBox(height: 8.h),

            // Popular Places Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              itemCount: popularPlaces.length,
              itemBuilder: (context, index) {
                final place = popularPlaces[index];
                return _placeCard(place["image"], place["name"], place["rating"]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Category Button
  Widget _categoryButton(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
        ),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // Popular Place Card
  Widget _placeCard(String imageUrl, String name, double rating) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(imageUrl, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 10.h,
          left: 10.w,
          right: 10.w,
          child: Container(
            padding: REdgeInsets.symmetric(vertical: 4.r, horizontal: 8.h),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 4.w),
                    Text(rating.toString(), style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Bottom Navigation Bar
