import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sell_its/model/product.dart';

class Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Product product = Product();

  addproduct(Product product) {
    firestore
        .collection('product')
        .add({
          'ProductName': product.productName,
          'productprice': product.price,
          'productdesc': product.description,
          'productcat': product.category
        })
        .then((value) => print('product added'))
        .catchError((error) => print('failed to add product'));
  }

  // loadproduct() {
  //   firestore.collection('product').get(
  //     FutureBuilder<DocumentSnapshot>(
  //       future: firestore.doc(Product product).get
  //       builder: null)
  //   );
  // }

  // loadproduct() async {
  //   var snapshot = await firestore.collection('product').get();
  //   for (var doc in snapshot.docs)
  // }

  loadproduct() {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('product').snapshots();
    return collectionStream;
  }
}
