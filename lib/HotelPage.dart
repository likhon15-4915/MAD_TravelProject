import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {"name": "Pan Pacific Sonargaon", "location": "Dhaka", "price": "৳18,000 (2 nights)"},
    {"name": "The Peninsula Chittagong", "location": "Chittagong", "price": "৳14,000 (2 nights)"},
    {"name": "Seagull Hotel", "location": "Cox's Bazar", "price": "৳20,000 (3 nights)"},
    {"name": "Hotel Agrabad", "location": "Chittagong", "price": "৳13,000 (2 nights)"},
    {"name": "Royal Tulip Sea Pearl Beach Resort", "location": "Cox's Bazar", "price": "৳25,000 (3 nights)"},
    {"name": "Long Beach Hotel", "location": "Cox's Bazar", "price": "৳17,500 (3 nights)"},
    {"name": "Rangamati Hill Resort", "location": "Rangamati", "price": "৳12,500 (2 nights)"},
    {"name": "Sajek Valley Resort", "location": "Sajek Valley", "price": "৳18,000 (3 nights)"},
    {"name": "Boga Lake Resort", "location": "Bandarbans", "price": "৳18,500 (2 nights)"},
    {"name": "Hotel Tanguar Haor", "location": "Sylhet", "price": "৳15,000 (2 nights)"},
    {"name": "Srimangal Tea Resort", "location": "Srimangal", "price": "৳16,500 (3 nights)"},
    {"name": "Ocean Paradise Hotel & Resort", "location": "Cox's Bazar", "price": "৳22,000 (3 nights)"},
    {"name": "Hotel Star Park", "location": "Khulna", "price": "৳10,500 (2 nights)"},
    {"name": "Hotel City Inn", "location": "Rajshahi", "price": "৳9,000 (2 nights)"},
    {"name": "Grand Sylhet Hotel & Resort", "location": "Sylhet", "price": "৳20,000 (2 nights)"},
    {"name": "Hotel Sea Crown", "location": "Cox's Bazar", "price": "৳15,000 (3 nights)"},
    {"name": "Rose View Hotel", "location": "Sylhet", "price": "৳18,000 (2 nights)"},
    {"name": "Hotel Naz Garden", "location": "Bogura", "price": "৳14,000 (2 nights)"},
    {"name": "The Westin Dhaka", "location": "Dhaka", "price": "৳30,000 (2 nights)"},
    {"name": "Hotel Shuktara", "location": "Dhaka", "price": "৳8,000 (2 nights)"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Booking"),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                hotel["name"],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${hotel["location"]} - ${hotel["price"]}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Booking is processing ${hotel["name"]}")),
                  );
                },
                child: Text("Book", style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }
}
