import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metoweapp/home/home.dart';
import 'package:metoweapp/login/login.dart';
import 'package:metoweapp/models/functions.dart';
import 'package:http/http.dart' as http;
import 'package:metoweapp/models/url.dart';

class registerPage2 extends StatelessWidget {
  int me_id = 0;

  registerPage2({this.me_id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _mainBody(me_id: me_id),
      ),
    );
  }
}

class _mainBody extends StatefulWidget {
  int me_id = 0;

  _mainBody({this.me_id});

  @override
  __mainBodyState createState() => __mainBodyState(me_id);
}

class __mainBodyState extends State<_mainBody> {
  bool _buttonClicked = false;

  int me_id = 0;

  __mainBodyState(this.me_id);

  int _countryValue = 0;
  int _stateValue = 0;
  int _cityValue = 0;
  int _interestInValue = 0;
  int _professionValue = 0;

  List _countryList = [
    {
      'name': 'India',
      'value': 'IN',
    }
  ];
  List _stateList = ['Delhi'];
  List _cityList = ['New Delhi'];
  List _interestInList = ['Male', 'Female', 'Others'];
  List _professionList = ['Engineer'];
  List _qualificationValue = ['Test'];

  List _interestList = [
    {
      'value': 'Animals',
      'enabled': true,
    },
    {
      'value': 'Card',
      'enabled': false,
    },
  ];

  List _languageList = [
    {
      'value': 'English',
      'enabled': true,
    },
    {
      'value': 'Hindi',
      'enabled': false,
    },
  ];

  _register() async {
    try {
      setState(() {
        _buttonClicked = true;
      });

      var body = jsonEncode({
        "country": "IN",
        "state": "UP",
        "city": "12",
        "intrest_in": "Female",
        "profession": "12",
        "intrest": "1,2",
        "language": "23",
        "education": "12",
        "smoking_habbit": "5",
        "drinking_habbit": "",
        "eating_preference": "",
        "about_me": "testing data",
        "user_id": "2297",
        "me_id": me_id.toString(),
      });

      var response = await http.post(register2Url, body: body);

      if (response.statusCode != 200) {
        customSnackBar(context, 'Internal Server Error');
      } else if (response.body != '') {
        var data = jsonDecode(response.body);

        if (data['message'] == 'Successfully') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => homePage()),
              (route) => false);
          return;
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
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/image/logo.jpeg',
              width: 80,
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(3),
              ),
              child: DropdownButton(
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'India',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Uttar Pradesh',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Noida',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Male',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      'Female',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      'Both',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Software Developer',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Test',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Interest',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    children: List.generate(_interestList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _interestList[index]['enabled'] =
                                _interestList[index]['enabled'] ? false : true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            border: _interestList[index]['enabled']
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey[300]),
                            borderRadius: BorderRadius.circular(50),
                            color: _interestList[index]['enabled']
                                ? Colors.yellow
                                : Colors.white,
                          ),
                          child: Text(
                            _interestList[index]['value'],
                            style: TextStyle(
                                color: _interestList[index]['enabled']
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    children: List.generate(_languageList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _languageList[index]['enabled'] =
                                _languageList[index]['enabled'] ? false : true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            border: _languageList[index]['enabled']
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey[300]),
                            borderRadius: BorderRadius.circular(50),
                            color: _languageList[index]['enabled']
                                ? Colors.yellow
                                : Colors.white,
                          ),
                          child: Text(
                            _languageList[index]['value'],
                            style: TextStyle(
                                color: _languageList[index]['enabled']
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 12),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Drinker',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Smoker',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
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
                value: _countryValue,
                underline: SizedBox(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Eating Preferences',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _countryValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Descrive Yourself',
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
                    Icons.panorama_wide_angle_sharp,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxWidth: 60,
                ),
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
                    : Text('Register', style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
