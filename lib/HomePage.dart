import 'package:flutter/material.dart';
import 'CheckOutItems.dart';
import 'CheckInItems.dart';
import 'Transfers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SMS'),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 130.0),
              alignment: Alignment.center,
              padding: EdgeInsets.all(32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(280, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Transfers()));
                },
                child: Text('Transfers'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(280, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CheckOutItems()));
                },
                child: Text('Check-Out Items'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(280, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CheckInItems()));
                },
                child: Text('Check-In Items'),
              ),
            ),
          ]),
        ));
  }
}
