import 'package:flutter/material.dart';
import '../../common/ui/searchview.dart';
import '../components/hr_scrollview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        SearchView(),
        ListTile(
          title: Text(
            'Interviews'.toUpperCase(),
            style: TextStyle(
                fontSize: 18.00,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          trailing: Text(
              'View All',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.00,0.0,10.00,0.0),
          child:
        HRScrollView([]),
       
        ),
            Divider(),
         ListTile(
          title: Text(
            'Curriculum Vitae'.toUpperCase(),
            style: TextStyle(
                fontSize: 18.00,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          trailing: Text(
              'View All',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.00,0.0,10.00,0.0),
          child:
        HRScrollView([])),
         ListTile(
          title: Text(
            'Coaching'.toUpperCase(),
            style: TextStyle(
                fontSize: 18.00,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          trailing: Text(
              'View All',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.00,0.0,10.00,0.0),
          child:HRScrollView([])),
      ],
    )));
  }
}
