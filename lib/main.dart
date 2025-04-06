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

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  // TextEditingController to capture search input
  TextEditingController _searchController = TextEditingController();

  // List of hotels
  final List<Map<String, dynamic>> hotels = [
    {
      "name": "Pan Pacific Sonargaon",
      "location": "Dhaka",
      "price": "৳18,000 (2 nights)",
    },
    {
      "name": "The Peninsula Chittagong",
      "location": "Chittagong",
      "price": "৳14,000 (2 nights)",
    },
    {
      "name": "Seagull Hotel",
      "location": "Cox's Bazar",
      "price": "৳20,000 (3 nights)",
    },
    {
      "name": "Hotel Agrabad",
      "location": "Chittagong",
      "price": "৳13,000 (2 nights)",
    },
    {
      "name": "Royal Tulip Sea Pearl Beach Resort",
      "location": "Cox's Bazar",
      "price": "৳25,000 (3 nights)",
    },
    {
      "name": "Long Beach Hotel",
      "location": "Cox's Bazar",
      "price": "৳17,500 (3 nights)",
    },
    {
      "name": "Rangamati Hill Resort",
      "location": "Rangamati",
      "price": "৳12,500 (2 nights)",
    },
    {
      "name": "Sajek Valley Resort",
      "location": "Sajek Valley",
      "price": "৳18,000 (3 nights)",
    },
    {
      "name": "Boga Lake Resort",
      "location": "Bandarbans",
      "price": "৳18,500 (2 nights)",
    },
    {
      "name": "Hotel Tanguar Haor",
      "location": "Sylhet",
      "price": "৳15,000 (2 nights)",
    },
    {
      "name": "Srimangal Tea Resort",
      "location": "Srimangal",
      "price": "৳16,500 (3 nights)",
    },
  ];

  // Function to filter hotels based on search query
  List<Map<String, dynamic>> _filterHotels(String query) {
    return hotels.where((hotel) {
      String name = hotel["name"].toLowerCase();
      String location = hotel["location"].toLowerCase();
      String price = hotel["price"].toLowerCase();

      return name.contains(query.toLowerCase()) ||
          location.contains(query.toLowerCase()) ||
          price.contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Booking"),
        backgroundColor: Colors.green,
        actions: [
          // Search icon
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HotelSearchDelegate(hotels: hotels),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Hotels',
                hintText: 'Enter hotel name, location, or price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {}); // Update search results when typing
              },
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _filterHotels(_searchController.text).length,
                itemBuilder: (context, index) {
                  final hotel = _filterHotels(_searchController.text)[index];
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
                          // Removed hotel image, just showing details
                          SizedBox(height: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}

// Hotel Search Delegate for advanced search experience
class HotelSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> hotels;

  HotelSearchDelegate({required this.hotels});

  @override
  List<Widget> buildActions(BuildContext context) {
    // Clear search button
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Back button
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter hotels based on query
    final results = hotels.where((hotel) {
      return hotel["name"].toLowerCase().contains(query.toLowerCase()) ||
          hotel["location"].toLowerCase().contains(query.toLowerCase()) ||
          hotel["price"].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final hotel = results[index];
        return ListTile(
          title: Text(hotel["name"]),
          subtitle: Text("${hotel["location"]} - ${hotel["price"]}"),
          onTap: () {
            // Handle hotel detail navigation
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as user types
    final suggestions = hotels.where((hotel) {
      return hotel["name"].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final hotel = suggestions[index];
        return ListTile(
          title: Text(hotel["name"]),
          subtitle: Text(hotel["location"]),
        );
      },
    );
  }
}
