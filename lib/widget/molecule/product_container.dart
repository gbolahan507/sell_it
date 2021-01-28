import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/custom_menu.dart';
import 'package:sell_its/widget/atom/h1.dart';

class Product_Container extends StatelessWidget {
  final String productname;
  final String price;
  final String desc;
  final String category;

  const Product_Container(
      {Key key, this.productname, this.price, this.desc, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return InkWell(onTap: () {
      GestureDetector(
        onTapUp: (details) async {
          double dx = details.globalPosition.dx;
          double dy = details.globalPosition.dy;
          double dx2 = MediaQuery.of(context).size.width - dx;
          double dy2 = MediaQuery.of(context).size.width - dy;
          await showMenu(
              context: context,
              position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
              items: [
                // MyPopupMenuItem(
                //   onClick: () {
                //     Navigator.pushNamed(context, EditProduct.id,
                //         arguments: products[index]);
                //   },
                //   child: Text('Edit'),
                // ),
                MyPopupMenuItem(
                  onClick: () {
                    //   _store.deleteProduct(products[index].pId);
                    //   Navigator.pop(context);
                  },
                  child: Text('Delete'),
                ),
              ]);
        },
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: whitecolor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/gbolahan2.png',
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Apptext(
                            text: '${productname}',
                            color: thickblack,
                            allignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Apptext(
                            text: '${price}',
                            color: thickblack,
                            allignment: Alignment.centerLeft,
                            fontsize: 20,
                            fontweight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Apptext(
                            text: '${desc}',
                            color: thickblack,
                            allignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Apptext(
                            text: '${category}',
                            color: thickblack,
                            allignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ProdContainer extends StatelessWidget {
  final String productname;
  final String price;
  final String desc;
  final String category;

  ProdContainer({this.productname, this.price, this.desc, this.category});

  CollectionReference users = FirebaseFirestore.instance.collection('product');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) async {
        double dx = details.globalPosition.dx;
        double dy = details.globalPosition.dy;
        double dx2 = MediaQuery.of(context).size.width - dx;
        double dy2 = MediaQuery.of(context).size.width - dy;
        await showMenu(
            context: context,
            position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
            items: [
              MyPopupMenuItem(
                onClick: () {
                  // Navigator.pushNamed(context, EditProduct.id,
                  //     arguments: products[index]);
                },
                child: Text('Edit'),
              ),
              MyPopupMenuItem(
                onClick: () {
                  // _store.deleteProduct(products[index].pId);
                  users.doc('product').delete();
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
            ]);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'images/gbolahan2.png',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Opacity(
                opacity: .6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Apptext(
                          text: '${productname}',
                          color: thickblack,
                          allignment: Alignment.centerLeft,
                        ),
                        Apptext(
                          text: '${price}',
                          color: thickblack,
                          allignment: Alignment.centerLeft,
                          fontsize: 20,
                          fontweight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
