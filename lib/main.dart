import 'package:flutter/material.dart';

void main() => runApp(TravelPioneerApp());

class TravelPioneerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Pioneer',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Travel Pioneer",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1507525428034-b723cf961d3e'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                "Welcome to Travel Pioneer",
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            ...[
              {'icon': Icons.card_travel, 'title': "Packages"},
              {'icon': Icons.confirmation_number, 'title': "Tickets"},
              {'icon': Icons.hotel, 'title': "Hotel", 'route': HotelPage()},
              {'icon': Icons.backpack, 'title': "Accessories"},
              {'icon': Icons.navigation, 'title': "Navigation"},
              {'icon': Icons.local_hospital, 'title': "Emergencies"},
            ].map((item) {
              return ListTile(
                leading: Icon(item['icon'] as IconData, color: Colors.blue),
                title: Text(item['title'] as String),
                onTap: item['route'] != null
                    ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => item['route'] as Widget))
                    : null,
              );
            }),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Explore the world with Travel Pioneer!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

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
        backgroundColor: Colors.green,
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
              title: Text(hotel["name"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("${hotel["location"]} - ${hotel["price"]}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Booking is processing ${hotel["name"]}")),
                ),
                child: Text("Book Now"),
              ),
            ),
          );
        },
      ),
    );
  }
}
