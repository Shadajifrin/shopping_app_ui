import 'package:flutter/material.dart';

class IphonesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iphones'),
        leading: BackButton(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children: [
          ProductItem('IPhone 13', 'USD 999', 'https://tse3.mm.bing.net/th?id=OIP.2o3FJBnp6m3sbSMj-BHr1wHaJc&pid=Api&P=0&h=180'),
          ProductItem('Iphone  11 Pro', 'USD 999', 'https://tse3.mm.bing.net/th?id=OIP.wt-gnl-EjDw6D6ibXCcIGwHaHa&pid=Api&P=0&h=180'),
          ProductItem('IPhone 12', 'USD 999', 'https://tse1.mm.bing.net/th?id=OIP.PSd6wxGdQ7mv_KlVXQlb2AHaHa&pid=Api&P=0&h=180'),
          ProductItem('IPhone pro 13', 'USD 1299', 'https://tse4.mm.bing.net/th?id=OIP.W0k4EZH3iIyai5HT2jGkPwAAAA&pid=Api&P=0&h=180'),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  ProductItem(this.name, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/product_detail',
            arguments: {'name': name, 'price': price, 'image': image},
          );
        },
        child: Column(
          children: [
            Image.network(image), // Placeholder image
            Text(name),
            Text(price),
          ],
        ),
      ),
    );
  }
}
