import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const String routeName = 'RestaurantDetailScreen';
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gourmet Haven",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              "Our Signature Dish",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),

            // Signature Dish Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                "assets/images/bestDishImage.png", // Replace with actual image
                height: 300.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.h),

            // Dish Description
            Text(
              "Seafood Paella: A vibrant medley of fresh shrimp, mussels, and aromatic saffron rice",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10.h),

            // View Full Menu Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2B67E9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Text("View Full Menu",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              ),
            ),
            SizedBox(height: 20.h),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Follow Us",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      size: 24.sp),
                  onPressed: () {
                      launchMyUli('https://www.facebook.com/momen.yosri.1');
                    },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      size: 24.sp),
                  onPressed: () {
                    launchMyUli('https://www.instagram.com/momen_yosri');
                  },
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      size: 24.sp),
                  onPressed: () {
                    launchMyUli('https://x.com/momen_yosri?s=90');
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Map Section
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                "assets/images/location.png", //! Replace with actual map image from the model
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2B67E9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Text("Get Directions",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              ),
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