import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/model/cartmodel.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(args['image']),
            SizedBox(height: 20),
            Text(args['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(args['price'], style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 10),
            Text('Color'),
            Row(
              children: [
                ColorOption(Colors.black),
                ColorOption(Colors.blue),
                ColorOption(Colors.grey),
              ],
            ),
            SizedBox(height: 10),
            Text('Capacity'),
            Row(
              children: [
                CapacityOption('64 GB'),
                CapacityOption('256 GB'),
                CapacityOption('512 GB'),
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  final cartProvider = Provider.of<CartProvider>(context, listen: false);
                  cartProvider.addItem(CartItem(
                    name: args['name'],
                    image: args['image'],
                    count: 1,
                    price: double.parse(args['price'].substring(4)), // Convert price to double
                  ));
                  Navigator.pushNamed(context, '/cart');
                },
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  ColorOption(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class CapacityOption extends StatelessWidget {
  final String capacity;

  CapacityOption(this.capacity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(capacity),
    );
  }
}
