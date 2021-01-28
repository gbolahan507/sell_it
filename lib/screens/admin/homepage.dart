import 'package:flutter/material.dart';
import 'package:sell_its/screens/admin/add_productscreen.dart';
import 'package:sell_its/screens/admin/manageproduct.dart';
import 'package:sell_its/widget/atom/button_filled.dart';

class Admin_homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonFilled(
                text: 'Add Product',
                action: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Add_product()));
                },
                width: 200.0),
            SizedBox(
              height: height * 0.03,
            ),
            ButtonFilled(
              text: 'Edit Product',
              width: 200.0,
              action: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManageProduct()));
              },
            ),
            SizedBox(
              height: height * 0.03,
            ),
            ButtonFilled(
              text: 'Delete Product',
              width: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
