import 'package:coffee_firebase_demo/screens/auth/authenticate.dart';
import 'package:coffee_firebase_demo/screens/home/home.dart';
import 'package:coffee_firebase_demo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AnonUser>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
