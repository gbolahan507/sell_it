import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sell_its/model/feedscreen.dart';
import 'package:sell_its/model/foodPro.dart';
import 'package:sell_its/provider/adminMode.dart';
import 'package:sell_its/provider/modelHud.dart';
import 'package:provider/provider.dart';
import 'package:sell_its/screens/admin/homepage.dart';
import 'package:sell_its/screens/admin/manageproduct.dart';
import 'package:sell_its/widget/molecule/product_container.dart';
import 'package:sell_its/widget/molecule/productss.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
        // ChangeNotifierProvider<CartItem>(
        //   create: (context) => CartItem(),
        // ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNotifier(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FeedScreen(),
      ),
    );
  }
}
