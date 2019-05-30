import 'package:flutter/material.dart';
import '../../common/ui/searchview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(child:
        Column(
      children: <Widget>[

        SearchView(),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Coaching'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14.00,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(
                height: 6.00,
              ),
              Text(
                'Job Hunt Basics',
                style: TextStyle(fontSize: 24.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text(
              'You will have the best practice in how to successfully enter in job market',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          height: 20.00,
        ),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
        Divider(),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
        Divider(),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
        Divider(),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
         Divider(),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
         Divider(),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
         Divider(),
        ListTile(
          leading: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWEGtg3lCmcke1RBQGKPe2KHDZsiM3LD1Rgyi0nL8iFxUwsqle',
            width: 100.00,
            height: 100.00,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10/4/2019'.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.00,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              Text(
                'Create Your CV',
                style: TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
              )
            ],
          ),
          subtitle: Text('Sanjeev Kumar',
              style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    )));
  }
}
