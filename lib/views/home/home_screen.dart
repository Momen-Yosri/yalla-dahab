import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/views/home/widgets/category_button.dart';
import 'widgets/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "All";

  final List<Map<String, dynamic>> popularPlaces = [
    {"name": "Retac Qunay", "image": "assets/images/hotel_list1.jpg", "rating": 4.8},
    {"name": "Alley Palace", "image": "assets/images/hotel_list2.jpg", "rating": 4.1},
    {"name": "Sheraton", "image": "assets/images/hotel_list3.jpg", "rating": 4.3},
    {"name": "Semiramis", "image": "assets/images/hotel_list4.jpg", "rating": 4.5},
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

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
                    Text(
                      "Hi, (User name)",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
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
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
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
                tabAlignment: TabAlignment.start,
              ),

              SizedBox(height: 16),

              // Popular Places Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Places", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700)),
                  Text("View all", style: TextStyle(fontSize: 14.sp, color: Colors.blue, fontWeight: FontWeight.w600)),
                ],
              ),

              SizedBox(height: 24.h),

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
      ),
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
