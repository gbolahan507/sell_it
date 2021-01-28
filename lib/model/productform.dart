import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sell_its/model/foodPro.dart';
import 'package:sell_its/model/products.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/custom_input.dart';

class ProductForm extends StatefulWidget {
  final bool isUpdating;

  ProductForm({this.isUpdating});
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  var _product_name = TextEditingController();
  var _price = TextEditingController();
  var _description = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  TextEditingController categories = TextEditingController();
  File _fileImage;
  String _imageUrl;
  final picker = ImagePicker();

  List _category = [];
  Products _currentptoduct;

  Widget _showImage() {
    if (_fileImage == null && _imageUrl == null) {
      return Text('image is  here');
    } else if (_fileImage != null) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.file(
            _fileImage,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
              padding: EdgeInsets.all(16),
              color: Colors.black54,
              onPressed: () => _getLocalimage(),
              child: Text(
                'change image',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ))
        ],
      );
    } else if (_imageUrl != null) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.network(
            _imageUrl,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
              padding: EdgeInsets.all(16),
              color: Colors.black54,
              onPressed: () => _getLocalimage(),
              child: Text(
                'change image',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ))
        ],
      );
    }
  }

  Future _getLocalimage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 400,
    );

    if (pickedFile != null) {
      setState(() {
        _fileImage = File(pickedFile.path);
      });
    }
  }

  addcategories(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _category.add(text);
      });
      categories.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    ProductNotifier productform =
        Provider.of<ProductNotifier>(context, listen: false);
    if (productform.currentproduct != null) {
      _currentptoduct = productform.currentproduct;
    } else {
      _currentptoduct = Products();
    }
    _category.addAll(productform.currentproduct.category);
    _imageUrl = productform.currentproduct.image;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: widget.isUpdating == true
              ? Text('Edit Product')
              : Text('Create New Product'),
          centerTitle: true,
        ),
        body: Center(
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Form(
                            key: _formKey,
                            child: Column(children: [
                              _showImage(),
                              _imageUrl == null && _fileImage == null
                                  ? FlatButton(
                                      color: Colors.blue,
                                      onPressed: () => _getLocalimage(),
                                      child: Text('Add image'))
                                  : SizedBox(
                                      height: 30,
                                    ),
                              CustomInput(
                                labelText: 'product Name',
                                onSaved: (String value) {
                                  _currentptoduct.productName = value;
                                },
                                initialValue: _currentptoduct.productName,
                                validator: (val) =>
                                    val.isEmpty ? 'Entert product name' : null,
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              CustomInput(
                                labelText: 'Price',
                                initialValue: _currentptoduct.price,
                                onSaved: (String value) {
                                  _currentptoduct.price = value;
                                },
                                validator: (val) =>
                                    val.isEmpty ? 'Entert product name' : null,
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              CustomInput(
                                labelText: 'Description',
                                controller: _description,
                                validator: (val) =>
                                    val.isEmpty ? 'Entert product name' : null,
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: CustomInput(
                                      labelText: 'Category',
                                      controller: categories,
                                      validator: (val) => val.isEmpty
                                          ? 'Entert product name'
                                          : null,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  FlatButton(
                                      color: Colors.blue,
                                      child: Text('Add'),
                                      onPressed: () {
                                        addcategories(categories.text);
                                      }),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.1,
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                scrollDirection: Axis.vertical,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                                children: _category
                                    .map((e) => Card(
                                        color: teal100,
                                        child: Center(child: Text(e))))
                                    .toList(),
                              )
                            ])))))));
  }
}
