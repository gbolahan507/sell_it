import 'package:flutter/material.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/button_filled.dart';
import 'package:sell_its/widget/atom/custom_input.dart';

class AdminSignup extends StatelessWidget {
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _username = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: whitecolor,
          title: Text(
            'Login',
            style: TextStyle(
                color: blackcolor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 24, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomInput(
                      labelText: 'Username',
                      controller: _username,
                      validator: (val) => val.isEmpty ? 'enter username' : null,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    CustomInput(
                      labelText: 'Email',
                      controller: _email,
                      validator: (val) =>
                          val.isEmpty ? 'enter email address' : null,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    CustomInput(
                      labelText: 'Password',
                      controller: _password,
                      validator: (val) =>
                          val.isEmpty ? 'enter user password' : null,
                    ),
                    SizedBox(height: height * 0.1),
                    ButtonFilled(
                      text: 'Login',
                      action: () {
                        if (_formKey.currentState.validate()) {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => Wellcome_Screecn()));
                          print('login');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
