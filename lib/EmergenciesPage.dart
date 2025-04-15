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
    {
      "name": "Violence Against Women",
      "number": "10921",
      "icon": Icons.female,
      "color": Colors.pink,
    },
    {
      "name": "Immediate Reports (Social Problems)",
      "number": "333",
      "icon": Icons.report_problem,
      "color": Colors.deepPurple,
    },
    {
      "name": "Prevention of Child Marriage",
      "number": "109",
      "icon": Icons.child_care,
      "color": Colors.teal,
    },
    {
      "name": "Mental Health Support",
      "number": "01779554391",
      "icon": Icons.psychology,
      "color": Colors.indigo,
    },
    {
      "name": "Ain o Salish Kendra",
      "number": "01724415677",
      "icon": Icons.gavel,
      "color": Colors.brown,
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            child: ListTile(
              leading: Icon(contact['icon'], color: contact['color'], size: 30),
              title: Text(contact['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Text("Call: ${contact['number']}"),
                trailing: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: contact['color'],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => _callNumber(contact['number']),
                  icon: Icon(Icons.call, size: 18),
                  label: Text("Call"),
                ),

            ),
          );
        },
      ),
    );
  }
}
