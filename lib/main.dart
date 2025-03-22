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
        title: Text("Packages",),
        onTap: (){

        },
      ),
      ListTile(
        title: Text("Tickets",),
        onTap: (){

        },
      ),
      ListTile(
        title: Text("Hotel",),
        onTap: (){

        },
      ),

      ListTile(
        title: Text("Accessories",),
        onTap: (){

        },
      ),
      ListTile(
        title: Text("Navigation",),
        onTap: (){

        },),
      ListTile(
        title: Text("Emergemcies",),
        onTap: (){

        },
      ),

    ],

  ),
),




















    ),
  ));

}