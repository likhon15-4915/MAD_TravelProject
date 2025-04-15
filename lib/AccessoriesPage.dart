import 'package:flutter/material.dart';

class AccessoriesPage extends StatelessWidget {
  final List<Map<String, String>> accessories = [
    {
      "name": "Travel Backpack",
      "description": "Durable and spacious travel bag",
      "price": "BDT 2200",
    },
    {
      "name": "Travel First Aid Kit",
      "description": "Essential items for your trip",
      "price": "BDT 850",
    },
    {
      "name": "Sun Hat",
      "description": "Perfect for sunny vacations",
      "price": "BDT 450",
    },
    {
      "name": "Sunglasses",
      "description": "UV protection stylish glasses",
      "price": "BDT 1200",
    },
    {
      "name": "Roof Tent",
      "description": "Portable roof tent for adventures",
      "price": "BDT 12500",
    },
    {
      "name": "Neck Pillow",
      "description": "Comfortable neck support for flights",
      "price": "BDT 600",
    },
    {
      "name": "Water Bottle",
      "description": "Insulated travel bottle",
      "price": "BDT 350",
    },
    {
      "name": "Travel Organizer",
      "description": "Keep your essentials sorted",
      "price": "BDT 950",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Accessories"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: accessories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = accessories[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(item['description']!, style: TextStyle(fontSize: 12)),
                    SizedBox(height: 6),
                    Text(item['price']!, style: TextStyle(color: Colors.green)),
                    Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${item["name"]} added to cart")),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text("Add", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
