import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/views/home/widgets/category_button.dart';
import 'package:yalla_dahab/views/home/widgets/custom_drawer.dart';
import 'package:yalla_dahab/views/hotels/hotel_deitals_screen.dart';
import 'package:yalla_dahab/views/restaurant/resturtrant_deitals.dart';
import 'package:yalla_dahab/views/trips/trip_screen.dart';

import '../../core/style/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "All";
  String searchQuery = "";

  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allPlaces = [
    {"name": "Retac Qunay", "image": "assets/images/hotel_list1.jpg", "rating": 4.8, "category": "Hotels"},
    {"name": "Alley Palace", "image": "assets/images/hotel_list2.jpg", "rating": 4.1, "category": "Hotels"},
    {"name": "Sheraton", "image": "assets/images/hotel_list3.jpg", "rating": 4.3, "category": "Hotels"},
    {"name": "Semiramis", "image": "assets/images/hotel_list4.jpg", "rating": 4.5, "category": "Hotels"},
    {"name": "Sea Breeze", "image": "assets/images/restaurant1.jpg", "rating": 4.2, "category": "Restaurants"},
    {"name": "Lagoon Cafe", "image": "assets/images/restaurant2.jpg", "rating": 4.0, "category": "Restaurants"},
    {"name": "Golden Beach", "image": "assets/images/tourism1.jpg", "rating": 4.7, "category": "Tourism"},
    {"name": "Blue Lagoon", "image": "assets/images/tourism2.jpg", "rating": 4.6, "category": "Tourism"},
  ];

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.grid_view, "label": "All"},
    {"icon": Icons.hotel, "label": "Hotels"},
    {"icon": Icons.restaurant, "label": "Restaurants"},
    {"icon": Icons.beach_access, "label": "Tourism"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedCategory = categories[_tabController.index]["label"];
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _navigateBasedOnCategory(BuildContext context, Map<String, dynamic> place) {
    switch (place["category"]) {
      case "Hotels":
        Navigator.pushNamed(context, HotelDetailsPage.routeName, arguments: place);
        break;
      case "Restaurants":
        Navigator.pushNamed(context, RestaurantDetailScreen.routeName, arguments: place);
        break;
      case "Tourism":
        Navigator.pushNamed(context, TripDetailsScreen.routeName, arguments: place);
        break;
    }
  }

  List<Map<String, dynamic>> getFilteredPlaces() {
    List<Map<String, dynamic>> filtered = allPlaces;

    if (selectedCategory != "All") {
      filtered = filtered.where((place) => place["category"] == selectedCategory).toList();
    }

    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((place) => place["name"].toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: REdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search,color:  AppColors.primary,),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            searchQuery = "";
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.primary, width: 2), )
              ),
            ),
          ),

          // Category Tabs
          TabBar(tabAlignment: TabAlignment.start,
            controller: _tabController,
            indicatorColor: Color(0xff05C0FF),
            labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
            tabs: categories.map((category) {
              return Tab( 
                child: CategoryButton(

                  icon: category["icon"],
                  label: category["label"],
                  isSelected: selectedCategory == category["label"],
                ),
              );
            }).toList(),
            isScrollable: true,

          ),

          SizedBox(height: 16.h),

          // Grid View for Places
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                padding: EdgeInsets.only(top: 8.h),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemCount: getFilteredPlaces().length,
                itemBuilder: (context, index) {
                  final place = getFilteredPlaces()[index];
                  return _placeCard(context, place);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeCard(BuildContext context, Map<String, dynamic> place) {
    return InkWell(
      onTap: () => _navigateBasedOnCategory(context, place),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              place["image"],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
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
                  Text(
                    place["name"],
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      SizedBox(width: 4.w),
                      Text(
                        place["rating"].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
