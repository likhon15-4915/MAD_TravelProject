import 'package:flutter/material.dart';
import 'HotelPage.dart';
import 'NavigationPage.dart';
import 'EmergenciesPage.dart';


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
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Travel Pioneer - Celebrate the journey.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal ,
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
              {'icon': Icons.card_travel, 'title': "Packages"},
              {'icon': Icons.confirmation_number, 'title': "Tickets"},
              {'icon': Icons.hotel, 'title': "Hotel", 'route': HotelPage()},
              {'icon': Icons.backpack, 'title': "Accessories"},
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


      body: Center(
        child: Text(
          'Explore the world with Travel Pioneer!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
