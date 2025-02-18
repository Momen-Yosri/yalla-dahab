import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class HotelDetailsPage extends StatelessWidget {
  HotelDetailsPage({super.key});
  static const String routeName = "hotelDetailsPage";
  final String mainImage = "assets/images/mainHotelImage.png";
  final List<String> thumbnails = [
    "assets/images/hotel1.png",
    "assets/images/hotel2.png",
    "assets/images/hotel3.png",
    "assets/images/hotel4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Luxury Haven Hotel"),
      ),
      body: SingleChildScrollView(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(mainImage,
                  width: double.infinity, height: 200.h, fit: BoxFit.cover),
            ),
            SizedBox(height: 10.h),

            // Thumbnail Images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: thumbnails.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(image,
                      width: 80.w, height: 60.h, fit: BoxFit.cover),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),

            // Hotel Name & Stars
            Text("Luxury Haven Hotel",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600)),
            Row(
              children: List.generate(5,
                  (index) => Icon(Icons.star, color: Colors.amber, size: 24.sp)),
            ),
            SizedBox(height: 10.h),

            // Description
            Text(
              "Experience unparalleled luxury at Luxury Haven Hotel, where modern elegance meets world-class hospitality. "
              "Nestled in the heart of the city, our 5-star establishment offers breathtaking views, exquisite dining, "
              "and state-of-the-art amenities for the discerning traveler.",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),

            // Amenities
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  Icon(
                    Icons.wifi,
                    size: 24.sp,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  Text("Free Wi-Fi", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),
)
                ]),
                Column(children: [
                  Icon(
                    Icons.pool,
                    size: 24.sp,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  Text("Pool", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),)
                ]),
                Column(children: [
                  Icon(
                    Icons.local_parking,
                    size: 24.sp,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  Text("Parking", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),)
                ]),
                Column(children: [
                  Icon(
                    Icons.spa,
                    size: 24.sp,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                  Text("Spa", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),)
                ]),
              ],
            ),
            SizedBox(height: 20.h),

            // Contact Information
            Text("Contact Information",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Row(children: [
              Icon(
                Icons.phone,
                size: 18.sp,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              SizedBox(width: 8.w),
              Text(
                "+1 (555) 123-4567",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
              )
            ]),
            SizedBox(height: 5),
            Row(children: [
              Icon(
                Icons.email,
                size: 18.sp,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              SizedBox(width: 8.w),
              Text("info@luxuryhaven.com",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400))
            ]),
            SizedBox(height: 5),
            Row(children: [
              Icon(
                Icons.location_on,
                size: 18.sp,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              SizedBox(width: 8.w),
              Text("123 Luxury Avenue, Cityville, State 12345",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400))
            ]),
            SizedBox(height: 20),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {
                      launchMyUli('https://www.facebook.com/momen.yosri.1');
                  },
                  iconSize: 30.sp,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                SizedBox(width: 10.w),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {
                                        launchMyUli('https://www.instagram.com/momen_yosri');

                  },
                  iconSize: 30.sp,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                SizedBox(width: 10.w),
                IconButton(
                  icon: Icon(FontAwesomeIcons.twitter),
                  iconSize: 30.sp,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                  onPressed: () {
                                        launchMyUli('https://x.com/momen_yosri?s=90');

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
void launchMyUli(String url) async {
  final Uri _url = Uri.parse(url);
  bool canLaunch = await canLaunchUrl(_url);
  if (canLaunch) {
    launchUrlString(url);
    launchUrl(_url);
  } else {
    print('cannot launch');
  }
}