import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List coffeeItems = [];

  @override
  void initState() {
    super.initState();
    fetchCoffeeItems();
  }

  Future<void> fetchCoffeeItems() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/items'),
    );
    if (response.statusCode == 200) {
      setState(() {
        coffeeItems = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load coffee items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Shop'),
        backgroundColor: Colors.brown,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            coffeeItems.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: coffeeItems.length,
                  itemBuilder: (context, index) {
                    final item = coffeeItems[index];
                    return CoffeeCard(
                      name: item['name'],
                      price: item['price'].toString(),
                      imageUrl: 'http://localhost:3000${item['image']}',
                    );
                  },
                ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const CoffeeCard({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "$price SR",
                  style: TextStyle(fontSize: 14, color: Colors.brown),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
