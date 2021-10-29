import 'package:coffee_firebase_demo/screens/home/settings_form.dart';
import 'package:coffee_firebase_demo/models/brew.dart';
import 'package:coffee_firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_firebase_demo/services/database.dart';
import 'package:provider/provider.dart';
import 'package:coffee_firebase_demo/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            TextButton.icon(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
            )),
            child: BrewList()),
      ),
    );
  }
}
