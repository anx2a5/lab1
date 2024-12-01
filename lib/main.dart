import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      'name': 'Маица со кратки',
      'image': 'assets/150x150.png',
      'description': 'Краток опис на производот.',
      'price': '599 ден.'
    },
    {
      'name': 'Панталони',
      'image': 'assets/150x150.png',
      'description': 'Комфорни и модерни.',
      'price': '1299 ден.'
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Индекс број: 196019'), 
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(clothes[index]['image']!),
              title: Text(clothes[index]['name']!),
              subtitle: Text(clothes[index]['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: clothes[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product['image']!),
            SizedBox(height: 16),
            Text(product['description']!, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Цена: ${product['price']!}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
