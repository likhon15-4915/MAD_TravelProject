import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergenciesPage extends StatelessWidget {
  final List<Map<String, dynamic>> emergencyContacts = [
    {
      "name": "Police Station",
      "number": "999",
      "icon": Icons.local_police,
      "color": Colors.redAccent,
    },
    {
      "name": "Hospital",
      "number": "10666",
      "icon": Icons.local_hospital,
      "color": Colors.green,
    },
    {
      "name": "Fire Service",
      "number": "199",
      "icon": Icons.fire_extinguisher,
      "color": Colors.orange,
    },
  ];

  void _callNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not call $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Services"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: emergencyContacts.length,
        itemBuilder: (context, index) {
          final contact = emergencyContacts[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(contact['icon'], color: contact['color'], size: 30),
              title: Text(contact['name'], style: TextStyle(fontSize: 18)),
              subtitle: Text("Call: ${contact['number']}"),
              trailing: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: contact['color']),
                onPressed: () => _callNumber(contact['number']),
                icon: Icon(Icons.call),
                label: Text("Call"),
              ),
            ),
          );
        },
      ),
    );
  }
}
