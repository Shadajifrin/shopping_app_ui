import 'package:flutter/material.dart';

class LaptopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptops'),
        leading: BackButton(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children: [
          ProductItem('Surface laptop 3', 'USD 999','https://tse2.mm.bing.net/th?id=OIP.q5suJg3zILqAyY_1_iA7ZAHaFj&pid=Api&P=0&h=180'),
          ProductItem('XPS laptop 13', 'USD 999','https://tse3.mm.bing.net/th?id=OIP.7cGSFaX7o1tstgUCmlB9eQHaHa&pid=Api&P=0&h=180'),
          ProductItem('LG Gram 17', 'USD 999','https://tse3.mm.bing.net/th?id=OIP.ODr6ZZkaWtxLNbrNY6JNfAAAAA&pid=Api&P=0&h=180'),
          ProductItem('Macbook pro 13', 'USD 1299','https://tse1.mm.bing.net/th?id=OIP.bWMTGRAWZoUn9_m8DwLdzgHaFO&pid=Api&P=0&h=180'),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  ProductItem(this.name, this.price,this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(image), // Placeholder image
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}
