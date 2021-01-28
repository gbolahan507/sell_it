import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sell_its/model/product.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/molecule/product_container.dart';

class ManageProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    CollectionReference users =
        FirebaseFirestore.instance.collection('product');
    return Scaffold(
        appBar: AppBar(
          title: Text('load product'),
          leading: BackButton(
            color: blackcolor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: StreamBuilder(
            stream: users.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('loading');
              }
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 0.7,
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3),
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot document = snapshot.data.docs[index];
                        return ProdContainer(
                          productname: document['ProductName'],
                          price: document['productprice'],
                          desc: document['productdesc'],
                          category: document['productcat'],
                        );
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
