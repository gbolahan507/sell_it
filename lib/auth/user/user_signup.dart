import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sell_its/services/auth.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/button_filled.dart';
import 'package:sell_its/widget/atom/custom_input.dart';
import 'package:sell_its/widget/atom/h1.dart';
import 'package:sell_its/widget/organism/homepage/homepage.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  var _email = TextEditingController();

  var _password = TextEditingController();

  var _username = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  Auth _auths = Auth();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: whitecolor,
          title: Text(
            'Sign Up',
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
                    Builder(
                      builder: (context) => ButtonFilled(
                        text: 'Sign UP',
                        action: () async {
                          if (_formKey.currentState.validate()) {
                            print('login');
                            try {
                              final result = await _auths.signUp(
                                  _email.text, _password.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              print(result.user.uid);
                            } catch (e) {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
