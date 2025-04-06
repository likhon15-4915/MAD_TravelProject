import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Travel Pioneer",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red

          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Drawer Header",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              leading: Icon(Icons.card_travel, size: 24, color: Colors.blue),
              title: Text("Packages",),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number, size: 24, color: Colors.blue),
              title: Text("Tickets",),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.hotel, size: 24, color: Colors.blue),
              title: Text("Hotel",),
              onTap: (){

              },
            ),

            ListTile(
              leading: Icon(Icons.backpack, size: 24, color: Colors.blue),
              title: Text("Accessories",),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.navigation, size: 24, color: Colors.blue),
              title: Text("Navigation",),
              onTap: (){

              },),
            ListTile(
              leading: Icon(Icons.local_hospital, size: 24, color: Colors.blue),
              title: Text("Emergencies",),
              onTap: (){

              },
            ),

          ],

        ),
      ),

    ),
  ));

}