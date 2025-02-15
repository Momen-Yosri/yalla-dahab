import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_dahab/views/hotels/hotel_deitals_screen.dart';


class AllAvailableHotelsPage extends StatelessWidget {
  AllAvailableHotelsPage({super.key});
  static const String routeName = "HotelPage";
  final List<Map<String, dynamic>> hotels = List.generate(7, (index) => {
        "name": "Heden golf",
        "rating": 3.9,
        "image": "assets/images/hotel_demo.png",
        "description": "Set in landscaped gardens overlooking the ..."
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text("Hotels", ),
       
      ),
      body: ListView.builder(
        padding: REdgeInsets.all(10),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return InkWell(onTap: () {
            Navigator.pushNamed(context, HotelDetailsPage.routeName);
          },
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              margin: REdgeInsets.symmetric(vertical: 5.h),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    hotel["image"],
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  hotel["name"],
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(hotel["rating"].toString(),style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w300),),
                      ],
                    ),
                    Text(hotel["description"], maxLines: 1, overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w300),),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
