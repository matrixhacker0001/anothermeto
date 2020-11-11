import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metoweapp/home/home.dart';
import 'package:metoweapp/login/register.dart';
import 'package:metoweapp/models/functions.dart';
import 'package:http/http.dart' as http;
import 'package:metoweapp/models/url.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image/background.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: _mainBody(),
        ),
      ),
    );
  }
}

class _mainBody extends StatefulWidget {
  @override
  __mainBodyState createState() => __mainBodyState();
}

class __mainBodyState extends State<_mainBody> {
  bool _buttonClicked = false;

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  _login() async {
    try {
      var user = _username.text;
      var pass = _password.text;

      if (user == '' || pass == '') {
        customSnackBar(context, 'Please Fill All The Fields..!!');
        return;
      }

      setState(() {
        _buttonClicked = true;
      });

      var response = await http.post(loginUrl, body: {
        'email_id': user,
        'password': pass,
      });

      if (response.statusCode != 200) {
        customSnackBar(context, 'Internal Server Error');
      } else if (response.body != '') {
        var data = jsonDecode(response.body);

        if (data['message'] == '') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => homePage()));
        } else {
          customSnackBar(context, data['message']);
        }
      }

      setState(() {
        _buttonClicked = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 80,
                margin: EdgeInsets.only(top: 120, bottom: 60),
                child: Image.asset('assets/image/logo.jpeg'),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Wrap(
                  children: [
                    TextField(
                      controller: _username,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: Center(
                          child: Icon(
                            Icons.email,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxWidth: 40,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: Center(
                          child: Icon(
                            Icons.vpn_key,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxWidth: 40,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      child: FlatButton(
                        onPressed: _buttonClicked ? () {} : _login,
                        color: Colors.yellow,
                        child: _buttonClicked
                            ? Center(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    strokeWidth: 3,
                                  ),
                                ),
                              )
                            : Text('Login'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  color: Colors.yellow.withOpacity(.8),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => registerPage()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Align(
              // bottom: 0,
              alignment: Alignment.bottomCenter,
              child: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
