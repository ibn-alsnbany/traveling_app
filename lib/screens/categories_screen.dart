import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("دليل سياحي")),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        children:
            Categories_data.map(
              (categoryData) => CategoryItem(
                categoryData.id,
                categoryData.title,
                categoryData.imageUrl,
              ),
            ).toList(),
      ),
    );
  }
}
