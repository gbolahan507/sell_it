import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_its/model/foodPro.dart';
import 'package:sell_its/model/productform.dart';
import 'package:sell_its/util/colors.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fooddetails = Provider.of<ProductNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(fooddetails.currentproduct.productName),
      ),
      body: Center(
          child: Column(
        children: [
          Image.network(
            fooddetails.currentproduct.image,
            fit: BoxFit.cover,
            height: 250,
          ),
          SizedBox(
            height: 20,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            children: fooddetails.currentproduct.category
                .map((e) => Card(color: teal100, child: Center(child: Text(e))))
                .toList(),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductForm(isUpdating: true)));
        },
      ),
    );
  }
}
