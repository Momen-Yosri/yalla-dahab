import 'package:flutter/material.dart';

import 'package:flutter/material.dart';



class HotelDetailsPage extends StatelessWidget {
   HotelDetailsPage({super. key}) ;
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Luxury Haven Hotel", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(mainImage, width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),

            // Thumbnail Images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: thumbnails.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(image, width: 80, height: 60, fit: BoxFit.cover),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Hotel Name & Stars
            Text("Luxury Haven Hotel", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(
              children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 18)),
            ),
            SizedBox(height: 10),

            // Description
            Text(
              "Experience unparalleled luxury at Luxury Haven Hotel, where modern elegance meets world-class hospitality. "
              "Nestled in the heart of the city, our 5-star establishment offers breathtaking views, exquisite dining, "
              "and state-of-the-art amenities for the discerning traveler.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 20),

            // Amenities
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [Icon(Icons.wifi, size: 24), Text("Free Wi-Fi", style: TextStyle(fontSize: 12))]),
                Column(children: [Icon(Icons.pool, size: 24), Text("Pool", style: TextStyle(fontSize: 12))]),
                Column(children: [Icon(Icons.local_parking, size: 24), Text("Parking", style: TextStyle(fontSize: 12))]),
                Column(children: [Icon(Icons.spa, size: 24), Text("Spa", style: TextStyle(fontSize: 12))]),
              ],
            ),
            SizedBox(height: 20),

            // Contact Information
            Text("Contact Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(children: [Icon(Icons.phone, size: 18), SizedBox(width: 8), Text("+1 (555) 123-4567")]),
            SizedBox(height: 5),
            Row(children: [Icon(Icons.email, size: 18), SizedBox(width: 8), Text("info@luxuryhaven.com")]),
            SizedBox(height: 5),
            Row(children: [Icon(Icons.location_on, size: 18), SizedBox(width: 8), Text("123 Luxury Avenue, Cityville, State 12345")]),
            SizedBox(height: 20),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.facebook_sharp), onPressed: () {}),
                IconButton(icon: Icon(Icons.facebook_sharp), onPressed: () {}),
                IconButton(icon: Icon(Icons.facebook_sharp), onPressed: () {}),
       
              ],
            ),
          ],
        ),
      ),
    );
  }
}
