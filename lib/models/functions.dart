import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

unfocus(BuildContext context) {
  FocusScopeNode focus = FocusScope.of(context);

  if (!focus.hasPrimaryFocus) {
    focus.unfocus();
  }
}

customSnackBar(BuildContext context, String msg) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
