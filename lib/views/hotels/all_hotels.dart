import 'package:flutter/material.dart';


class HotelPage extends StatelessWidget {
  static const String routeName = "HotelPage";
  final List<Map<String, dynamic>> hotels = List.generate(7, (index) => {
        "name": "Heden golf",
        "rating": 3.9,
        "image": "assets/images/hotel_demo.png", // Replace with actual image
        "description": "Set in landscaped gardens overlooking the ..."
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Hotels", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  hotel["image"],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                hotel["name"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(hotel["rating"].toString()),
                    ],
                  ),
                  Text(hotel["description"], maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
