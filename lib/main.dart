import 'package:flutter/material.dart';
import 'NavigationPage.dart';

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
  final List<Map<String, dynamic>> drawerItems = [
    {'icon': Icons.card_travel, 'title': "Packages", 'route': PackagesPage()},
    {'icon': Icons.confirmation_number, 'title': "Tickets"},
    {'icon': Icons.hotel, 'title': "Hotel", 'route': HotelPage()},
    {'icon': Icons.backpack, 'title': "Accessories"},
    {'icon': Icons.navigation, 'title': "Navigation", 'route': NavigationPage()},
    {'icon': Icons.local_hospital, 'title': "Emergencies"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Pioneer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
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
              child: Text("Welcome to Travel Pioneer", style: TextStyle(color: Colors.black, fontSize: 16)),
            ),
            ...drawerItems.map((item) {
              return ListTile(
                leading: Icon(item['icon'], color: Colors.blue),
                title: Text(item['title']),
                onTap: item['route'] != null
                    ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => item['route']))
                    : null,
              );
            }).toList(),
          ],
        ),
      ),
      body: Center(child: Text('Explore the world with Travel Pioneer!', style: TextStyle(fontSize: 18))),
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
      appBar: AppBar(title: Text("Hotel Booking"), backgroundColor: Colors.green),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Booking ${hotel["name"]}"))),
                child: Text("Book Now"),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
        appBar: AppBar(title: Text("Travel Packages"), backgroundColor: Colors.orange),
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
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Package selected: ${package["name"]}"))),
                    child: Text("Select"),
                  ),
                ),
              );
            },
            ),
        );
    }
}
