import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell_its/model/foodPro.dart';
import 'package:sell_its/model/productapi.dart';
import 'package:sell_its/model/productdetails.dart';
import 'package:sell_its/model/productform.dart';
import 'package:sell_its/util/colors.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    ProductNotifier product =
        Provider.of<ProductNotifier>(context, listen: false);
    getproduct(product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductNotifier product = Provider.of<ProductNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('feedscreen'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${product.productlist[index].productName}'),
              subtitle: Text('${product.productlist[index].description}'),
              onTap: () {
                product.currentproduct = product.productlist[index];
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductDetails()));
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: thickblack,
            );
          },
          itemCount: product.productlist.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          product.currentproduct = null;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductForm(
                        isUpdating: false,
                      )));
        },
      ),
    );
  }
}
