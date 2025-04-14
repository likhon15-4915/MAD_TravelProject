import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ticket Booking"),
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            tabs: [
              Tab(text: "Flight", icon: Icon(Icons.flight)),
              Tab(text: "Bus", icon: Icon(Icons.directions_bus)),
              Tab(text: "Train", icon: Icon(Icons.train)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TicketTabContent(title: "Flight Booking", color: Colors.lightBlueAccent),
            TicketTabContent(title: "Bus Booking", color: Colors.orangeAccent),
            TicketTabContent(title: "Train Booking", color: Colors.greenAccent),
          ],
        ),
      ),
    );
  }
}

class TicketTabContent extends StatelessWidget {
  final String title;
  final Color color;

  TicketTabContent({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(0.1),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
