import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sell_its/model/foodPro.dart';
import 'package:sell_its/model/products.dart';

getproduct(ProductNotifier productNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('goods').get();
  List<Products> _productlist = [];
  snapshot.docs.forEach((document) {
    Products products = Products.fromMap(document.data());
    _productlist.add(products);
  });
  productNotifier.productlist = _productlist;
}
