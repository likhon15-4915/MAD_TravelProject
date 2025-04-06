import 'package:flutter/material.dart';

void main() {
  runApp(TravelPioneerApp());
}

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
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Welcome to Travel Pioneer",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1507525428034-b723cf961d3e'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.card_travel, color: Colors.blue),
              title: Text("Packages"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number, color: Colors.blue),
              title: Text("Tickets"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.hotel, color: Colors.blue),
              title: Text("Hotel"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.backpack, color: Colors.blue),
              title: Text("Accessories"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.navigation, color: Colors.blue),
              title: Text("Navigation"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.blue),
              title: Text("Emergencies"),
              onTap: () {},
            ),
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

// Hotel Page with 11 hotels and Book Now button
class HotelPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    // Original 6 Hotels
    {
      "name": "Pan Pacific Sonargaon",
      "location": "Dhaka",
      "price": "৳18,000 (2 nights)"
    },
    {
      "name": "The Peninsula Chittagong",
      "location": "Chittagong",
      "price": "৳14,000 (2 nights)"
    },
    {
      "name": "Seagull Hotel",
      "location": "Cox's Bazar",
      "price": "৳20,000 (3 nights)"
    },
    {
      "name": "Hotel Agrabad",
      "location": "Chittagong",
      "price": "৳13,000 (2 nights)"
    },
    {
      "name": "Royal Tulip Sea Pearl Beach Resort",
      "location": "Cox's Bazar",
      "price": "৳25,000 (3 nights)"
    },
    {
      "name": "Long Beach Hotel",
      "location": "Cox's Bazar",
      "price": "৳17,500 (3 nights)"
    },

    // New 5 Hotels
    {
      "name": "Hotel Tanguar Haor",
      "location": "Sylhet",
      "price": "৳15,000 (2 nights)"
    },
    {
      "name": "Rangamati Hill Resort",
      "location": "Rangamati",
      "price": "৳12,500 (2 nights)"
    },
    {
      "name": "Srimangal Tea Resort",
      "location": "Srimangal",
      "price": "৳16,500 (3 nights)"
    },
    {
      "name": "Sundarbans Hotel & Resort",
      "location": "Sundarbans",
      "price": "৳22,000 (3 nights)"
    },
    {
      "name": "Boga Lake Resort",
      "location": "Bandarbans",
      "price": "৳18,500 (2 nights)"
    },
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
            margin: EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel["name"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    hotel["location"],
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Reservation Cost: ${hotel["price"]}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Booking initiated for ${hotel["name"]}"),
                          ),
                        );
                      },
                      child: Text("Book Now"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
