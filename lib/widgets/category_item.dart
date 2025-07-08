import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  // ignore: prefer_const_constructors_in_immutables
  CategoryItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(imageUrl, height: 250, fit: BoxFit.cover),
        ),
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          // ignore: sort_child_properties_last
          child: Text(
            title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),

          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.45),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}
