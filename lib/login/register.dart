import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metoweapp/login/register2.dart';
import 'package:metoweapp/models/functions.dart';
import 'package:http/http.dart' as http;
import 'package:metoweapp/models/url.dart';

class registerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _mainBody(),
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

  int _genderValue = 0;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  TextEditingController _dob = TextEditingController();

  List<String> _genderList = [
    'Male',
    'Female',
    'Others',
  ];

  _date() async {
    try {
      var date = await showDatePicker(
        context: this.context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 36500)),
        lastDate: DateTime.now(),
      );

      if (date != null) {
        _dob.text = date.year.toString() +
            '-' +
            date.month.toString() +
            '-' +
            date.day.toString();
      }
    } catch (e) {
      print(e);
    }
  }

  _register() async {
    try {
      var name = _name.text;
      var email = _email.text;
      var pass = _password.text;
      var cpass = _cpassword.text;
      var date = _dob.text;

      if (name == '' ||
          email == '' ||
          pass == '' ||
          cpass == '' ||
          date == '') {
        customSnackBar(context, 'Please Fill All The Fields..!!');
        return;
      } else if (pass != cpass) {
        customSnackBar(context, 'Password Doesn\'t Match..!!');
        return;
      }

      setState(() {
        _buttonClicked = true;
      });

      var response = await http.post(registerUrl, body: {
        'username': name,
        'dob': date,
        'gender': _genderList[_genderValue],
        'email': email,
        'password': pass,
      });

      if (response.statusCode != 200) {
        customSnackBar(context, 'Internal Server Error');
      } else if (response.body != '') {
        var data = jsonDecode(response.body);

        if (data['message'] == 'Registration successfully') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => registerPage2(me_id: data['data'])));
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset(
              'assets/image/logo.jpeg',
              width: 80,
            ),
            SizedBox(height: 50),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: 'Your Name',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                prefixIcon: Center(
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                prefixIcon: Center(
                  child: Icon(
                    Icons.mail,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                prefixIcon: Center(
                  child: Icon(
                    Icons.vpn_key,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _cpassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Confirm Password',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                prefixIcon: Center(
                  child: Icon(
                    Icons.vpn_key,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _dob,
              readOnly: true,
              onTap: () {
                _date();
              },
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                prefixIcon: Center(
                  child: Icon(
                    Icons.date_range,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 60,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(3),
              ),
              child: DropdownButton(
                value: _genderValue,
                underline: SizedBox(),
                isExpanded: true,
                items: List.generate(_genderList.length, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(
                      _genderList[index],
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    _genderValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                color: Colors.yellow,
                onPressed: _buttonClicked ? () {} : _register,
                child: _buttonClicked
                    ? Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 3,
                          ),
                        ),
                      )
                    : Text('Next', style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
