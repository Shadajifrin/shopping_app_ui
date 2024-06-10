
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app_ui/model/cartmodel.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                leading: Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(item.name),
                subtitle: Text('USD ${item.price.toStringAsFixed(2)}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => cart.decrementItem(item),
                    ),
                    Text(item.count.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => cart.incrementItem(item),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
