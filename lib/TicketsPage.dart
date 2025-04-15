import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tickets"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_bus), text: "Bus"),
              Tab(icon: Icon(Icons.train), text: "Train"),
              Tab(icon: Icon(Icons.flight), text: "Air"),
            ],
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: TabBarView(
          children: [
            TransportTab(title: "Bus", icon: Icons.directions_bus, transportData: _busData),
            TransportTab(title: "Train", icon: Icons.train, transportData: _trainData),
            TransportTab(title: "Air", icon: Icons.flight, transportData: _airData),
          ],
        ),
      ),
    );
  }
}

class TransportTab extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Map<String, String>> transportData;

  TransportTab({required this.title, required this.icon, required this.transportData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transportData.length,
      itemBuilder: (context, index) {
        final item = transportData[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: Icon(icon, color: Colors.blueAccent),
            title: Text("${item['name']} ($title)"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("From: ${item['from']}"),
                Text("To: ${item['to']}"),
                Text("Departure: ${item['departure']}"),
                Text("Arrival: ${item['arrival']}"),
                Text("Seats Available: ${item['seats']}"),
                Text("Price: ${item['price']}"),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Step 1: Show confirm dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Booking"),
                      content: Text(
                          "Do you want to confirm your ${title.toLowerCase()} ticket with ${item['name']} from ${item['from']} to ${item['to']}?"),
                      actions: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text("Confirm"),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close first dialog

                            // Step 2: Show success dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.green.shade100,
                                  title: Text("Booking Confirmed",
                                      style: TextStyle(color: Colors.green.shade800)),
                                  content: Text(
                                    "Your ${title.toLowerCase()} ticket with ${item['name']} from ${item['from']} to ${item['to']} is confirmed.",
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("OK",
                                          style: TextStyle(color: Colors.green.shade900)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Book"),
            ),
          ),
        );
      },
    );
  }
}



// Updated dummy data with 'from' and 'to'

final List<Map<String, String>> _busData = [
  {"name": "Green Line", "from": "Dhaka", "to": "Chittagong", "departure": "07:00 AM", "arrival": "12:00 PM", "seats": "20", "price": "BDT 550"},
  {"name": "Shohag Elite", "from": "Dhaka", "to": "Cox's Bazar", "departure": "09:30 AM", "arrival": "03:30 PM", "seats": "12", "price": "BDT 620"},
  {"name": "ENA Transport", "from": "Dhaka", "to": "Sylhet", "departure": "11:00 AM", "arrival": "05:00 PM", "seats": "30", "price": "BDT 480"},
];

final List<Map<String, String>> _trainData = [
  {"name": "Sundarban Express", "from": "Dhaka", "to": "Khulna", "departure": "06:00 AM", "arrival": "01:00 PM", "seats": "60", "price": "BDT 350"},
  {"name": "Padma Express", "from": "Dhaka", "to": "Rajshahi", "departure": "08:00 AM", "arrival": "02:30 PM", "seats": "40", "price": "BDT 400"},
  {"name": "SilkCity Express", "from": "Dhaka", "to": "Bogura", "departure": "01:00 PM", "arrival": "08:00 PM", "seats": "35", "price": "BDT 380"},
];

final List<Map<String, String>> _airData = [
  {"name": "Biman Bangladesh", "from": "Dhaka", "to": "Cox's Bazar", "departure": "08:00 AM", "arrival": "09:00 AM", "seats": "10", "price": "BDT 8500"},
  {"name": "US-Bangla", "from": "Dhaka", "to": "Chittagong", "departure": "10:30 AM", "arrival": "11:30 AM", "seats": "6", "price": "BDT 7900"},
  {"name": "Novoair", "from": "Dhaka", "to": "Sylhet", "departure": "02:00 PM", "arrival": "03:00 PM", "seats": "8", "price": "BDT 8200"},
];
