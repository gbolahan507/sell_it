import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sell_its/model/product.dart';
import 'package:sell_its/model/store.dart';
import 'package:sell_its/provider/modelHud.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/button_filled.dart';
import 'package:sell_its/widget/atom/custom_input.dart';
import 'package:sell_its/widget/atom/h1.dart';
import 'dart:io';

class Add_product extends StatefulWidget {
  @override
  _Add_productState createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  var _product_name = TextEditingController();
  var _price = TextEditingController();
  var _description = TextEditingController();
  var _category = TextEditingController();
  final _formKey = new GlobalKey<FormState>();

  PickedFile _image;
  final _picker = ImagePicker();

  Store store = Store();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomInput(
                        labelText: 'product Name',
                        controller: _product_name,
                        validator: (val) =>
                            val.isEmpty ? 'Entert product name' : null,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      CustomInput(
                        labelText: 'Price',
                        controller: _price,
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
                      CustomInput(
                        labelText: 'Category',
                        controller: _category,
                        validator: (val) =>
                            val.isEmpty ? 'Entert product name' : null,
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      ButtonFilled(
                        text: 'Add Product',
                        action: () {
                          if (_formKey.currentState.validate()) {
                            final hud =
                                Provider.of<ModelHud>(context, listen: false);
                            hud.changeisLoading(true);
                            try {
                              store.addproduct(Product(
                                  productName: _product_name.text,
                                  price: _price.text,
                                  description: _description.text,
                                  category: _category.text));
                              print('product added successful');
                              hud.changeisLoading(false);
                            } catch (e) {
                              hud.changeisLoading(false);
                              print(e.toString());
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageprofile() {
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((builder) => bottomsheet()));
            },
            child: CircleAvatar(
                radius: 50,
                backgroundImage: _image == null
                    ? AssetImage('images/gbolahan2.png')
                    : FileImage(File(_image.path))),
          ),
          Positioned(
            bottom: 20,
            right: -5,
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomsheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                )),
          )
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      height: 150,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Apptext(text: 'Edit Photo'),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: thickblack,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: pink300,
                    radius: 25,
                    child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () {
                          takephoto(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        color: Colors.white),
                  ),
                  Apptext(text: 'camera')
                ],
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 25,
                    child: IconButton(
                        icon: Icon(Icons.image),
                        onPressed: () {
                          Navigator.pop(context);
                          takephoto(ImageSource.gallery);
                        },
                        color: Colors.white),
                  ),
                  Apptext(text: 'gallery')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _image = pickedFile;
    });
  }
}
