
import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import '../models/product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> _products = [
    Product('Blouse', 'Elegant silk blouse', 100.0, 'blouse.jpg'),
    Product('Dress', 'Vibrant summer dress', 150.0, 'dress.jpg'),
    Product('Pants', 'Casual cotton pants', 80.0, 'pants.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing App'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.asset('assets/${product.imageUrl}'),
                title: Text(product.name),
                subtitle: Text(product.description),
              ),
            ),
          );
        },
      ),
    );
  }
}
