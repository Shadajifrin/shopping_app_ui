import 'package:flutter/material.dart';
import 'package:shopping_app_ui/screens/iphonescreen.dart';
import 'package:shopping_app_ui/screens/laptopscreen.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: BackButton(),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          CategoryItem('All', () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => AllScreen()));
          }),
          CategoryItem('Computers', () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => ComputersScreen()));
          }),
          CategoryItem('Accessories', () {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => AccessoriesScreen()));
          }),
          CategoryItem('Smartphones', () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => SmartphonesScreen()));
          }),
          CategoryItem('Smart Objects', () {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => SmartObjectsScreen()));
          }),
          CategoryItem('Speakers', () {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => SpeakersScreen()));
          }),
          CategoryItem('Iphones', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => IphonesScreen()));
          }),
          CategoryItem('Laptops', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LaptopScreen()));
          }),
          // Add more CategoryItems here with corresponding navigation
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  CategoryItem(this.name, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        onTap: onTap,
      ),
    );
  }
}
