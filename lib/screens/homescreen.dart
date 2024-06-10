import 'package:flutter/material.dart';
import 'package:shopping_app_ui/screens/categoryscreen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          // Featured Product
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bose Home Speaker', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('USD 279', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Spacer(),
                Image.network('https://tse3.mm.bing.net/th?id=OIP.HlEskn7HZrHt9Ilzuc4W6QAAAA&pid=Api&P=0&h=180', width: 100, height: 100), // Ensure you have an image asset named 'speaker.png'
              ],
            ),
          ),
          // Categories
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryIcon(Icons.category, 'Categories', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
                }),
                CategoryIcon(Icons.favorite, 'Favorites', () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen()));
                }),
                CategoryIcon(Icons.card_giftcard, 'Gifts', () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => GiftsScreen()));
                }),
                CategoryIcon(Icons.star, 'Best Selling', () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => BestSellingScreen()));
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Sales', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SalesItem('Smartphones', '50%','https://tse2.mm.bing.net/th?id=OIP.PlgdJNJPe3m1p4xkBEyNvgHaHa&pid=Api&P=0&h=180'),
                    SalesItem('Monitors', '40%','https://tse2.mm.bing.net/th?id=OIP.oMAKQzBWG5wp7BQ50Na2UQHaHa&pid=Api&P=0&h=180'),
                    SalesItem('Laptops', '20%','https://tse3.mm.bing.net/th?id=OIP.ODr6ZZkaWtxLNbrNY6JNfAAAAA&pid=Api&P=0&h=180'),
                    SalesItem('Tablets', '70%','https://tse4.mm.bing.net/th?id=OIP.c8_OS2EqV6qQSIpnpNEKNQAAAA&pid=Api&P=0&h=180'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          // Handle navigation based on the tapped index
        },
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  CategoryIcon(this.icon, this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(16),
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          Text(label, style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

class SalesItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageurl;

  SalesItem(this.name, this.price,this.imageurl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageurl), 
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 5, 80, 172))),
        ],
      ),
    );
  }
}
