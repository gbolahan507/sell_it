import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sell_its/auth/admin/admin_loginin.dart';
import 'package:sell_its/provider/adminMode.dart';
import 'package:sell_its/provider/modelHud.dart';
import 'package:sell_its/services/auth.dart';
import 'package:sell_its/util/colors.dart';
import 'package:sell_its/widget/atom/button_filled.dart';
import 'package:sell_its/widget/atom/custom_input.dart';
import 'package:sell_its/widget/atom/h1.dart';
import 'package:sell_its/widget/organism/homepage/homepage.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  var _email = TextEditingController();

  var _password = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  Auth _auths = Auth();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final admin = Provider.of<AdminMode>(context, listen: false);

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
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHud>(context).isLoading,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 24, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            val.isEmpty ? 'enter email address' : null,
                      ),
                      SizedBox(height: height * 0.1),
                      Builder(
                        builder: (context) => ButtonFilled(
                          text: 'Login',
                          action: () async {
                            final hud =
                                Provider.of<ModelHud>(context, listen: false);
                            hud.changeisLoading(true);
                            if (_formKey.currentState.validate()) {
                              print('login');
                              try {
                                final result = await _auths.signIn(
                                    _email.text, _password.text);
                                hud.changeisLoading(false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                                print(result.user.uid);
                              } catch (e) {
                                hud.changeisLoading(false);
                                print(e.toString());
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(e.message)));
                              }
                            }
                            hud.changeisLoading(false);
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Apptext(
                          text: 'forgot password',
                          color: thickblack,
                          allignment: Alignment.centerRight,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // Provider.of<AdminMode>(context, listen: false)
                              admin.changeIsAdmin(true);
                            },
                            child: Text(
                              'i\'m an admin',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Provider.of<AdminMode>(context).isAdmin
                                      ? whitecolor
                                      : thickblack),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Provider.of<AdminMode>(context, listen: false)
                              admin.changeIsAdmin(false);
                            },
                            child: Text(
                              'i\'m a user',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Provider.of<AdminMode>(context,
                                              listen: true)
                                          .isAdmin
                                      ? thickblack
                                      : whitecolor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
