import 'package:flutter/material.dart';
import 'HotelPage.dart';
import 'NavigationPage.dart';
import 'EmergenciesPage.dart';
import 'TicketsPage.dart';
import 'AccessoriesPage.dart';
import 'Packages.dart';


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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Travel Pioneer - Celebrate the journey.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ...[
              {'icon': Icons.card_travel, 'title': "Packages", 'route': PackagesPage()},

              {'icon': Icons.confirmation_number, 'title': "Tickets", 'route': TicketsPage()},
              {'icon': Icons.hotel, 'title': "Hotel", 'route': HotelPage()},
              {'icon': Icons.backpack, 'title': "Accessories", 'route': AccessoriesPage()},
              {'icon': Icons.navigation, 'title': "Navigation", 'route': NavigationPage()},
              {'icon': Icons.local_hospital, 'title': "Emergencies", 'route': EmergenciesPage()},
            ].map((item) {
              return ListTile(
                leading: Icon(item['icon'] as IconData, color: Colors.blue),
                title: Text(item['title'] as String),
                onTap: item['route'] != null
                    ? () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => item['route'] as Widget));
                }
                    : null,
              );
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1502920917128-1aa500764ce7"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                color: Colors.black.withOpacity(0.4),
                padding: EdgeInsets.all(16),
                child: Text(
                  "Welcome to Travel Pioneer",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(blurRadius: 4, color: Colors.black, offset: Offset(1, 1)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Explore Services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildExpandedCard(context, Icons.confirmation_number, "Tickets", TicketsPage()),
                      _buildExpandedCard(context, Icons.hotel, "Hotel", HotelPage()),
                      _buildExpandedCard(context, Icons.backpack, "Accessories", AccessoriesPage()),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      _buildExpandedCard(context, Icons.navigation, "Navigation", NavigationPage()),
                      _buildExpandedCard(context, Icons.local_hospital, "Emergencies", EmergenciesPage()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildExpandedCard(BuildContext context, IconData icon, String title, Widget page) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Card(
          margin: EdgeInsets.all(6),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Color(0xFFF5F2F9),
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.blue),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
