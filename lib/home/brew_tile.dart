import 'package:flutter/material.dart';
import 'package:coffee_firebase_demo/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
