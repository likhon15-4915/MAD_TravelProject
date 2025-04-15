import 'package:flutter/material.dart';

class PackagesPage extends StatelessWidget {
  final List<Map<String, String?>> packages = [
    {"name": "Cox's Bazar Beach Delight", "description": "Enjoy the world's longest sea beach with a 3-day, 2-night package including luxury stay, guided tours, and seafood dinners.", "price": "৳25,000", "duration": "3 days, 2 nights"},
    {"name": "Sajek Valley Adventure", "description": "Escape to the serene Sajek Valley with a 3-day, 2-night package, featuring eco-resorts and hill trekking.", "price": "৳18,000", "duration": "3 days, 2 nights"},
    {"name": "Sylhet Tea Garden Escape", "description": "Experience the lush green tea gardens of Sylhet with a 2-day, 1-night package including a stay at a tea estate.", "price": "৳12,000", "duration": "2 days, 1 night"},
    {"name": "Sundarbans Wildlife Tour", "description": "Explore the world's largest mangrove forest with a 3-day, 2-night package including boat rides and forest safaris.", "price": "৳22,000", "duration": "3 days, 2 nights"},
    {"name": "Bandarban Hill Retreat", "description": "Relax in the tranquil hills of Bandarban with a 2-day, 1-night package including cultural tours and riverboat rides.", "price": "৳15,000", "duration": "2 days, 1 night"},
    {"name": "Dhaka City Cultural Tour", "description": "Discover the historical and cultural landmarks of Dhaka with a day-long guided tour.", "price": "৳5,000", "duration": "1 day"},
    {"name": "Saint Martin's Island Getaway", "description": "Spend a relaxing 3-day, 2-night tour on the beautiful Saint Martin's Island, including boat rides and local seafood.", "price": "৳28,000", "duration": "3 days, 2 nights"},
    {"name": "Rangamati and Sajek Valley Escape", "description": "Enjoy the peaceful hills and valleys of Rangamati and Sajek Valley in a 4-day, 3-night package.", "price": "৳20,000", "duration": "4 days, 3 nights"},
    {"name": "Chittagong Hill Tracts Adventure", "description": "Explore the natural beauty and cultural heritage of the Chittagong Hill Tracts with a 5-day, 4-night journey.", "price": "৳30,000", "duration": "5 days, 4 nights"},
    {"name": "Paharpur and Mahasthangarh Heritage Tour", "description": "A cultural exploration of ancient ruins with a 2-day, 1-night package visiting Paharpur and Mahasthangarh.", "price": "৳10,000", "duration": "2 days, 1 night"},
    {"name": "Kuakata Sea Beach Tour", "description": "Visit the unique sea beach where you can watch both sunrise and sunset. 3 days, 2-night package with guided tours.", "price": "৳18,500", "duration": "3 days, 2 nights"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel Packages"), backgroundColor: Colors.lightBlue),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(package["name"] ?? "No name provided", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("${package["description"]}\nPrice: ${package["price"]}\nDuration: ${package["duration"]}"),
              isThreeLine: true,
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Package selected: ${package["name"]}"),
                  ));
                },
                child: Text("Select", style: TextStyle(color: Colors.white)),

              ),
            ),
          );
        },
      ),
    );
  }
}
