import 'package:flutter/material.dart';

class SimpleListCol extends StatelessWidget {
  final String category, title, subtitle;
  SimpleListCol(
    this.category,
    this.title,
    this.subtitle,
  ) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            this.category.toUpperCase(),
            style: TextStyle(
                fontSize: 14.00,
                fontWeight: FontWeight.bold,
                color: Colors.teal),
          ),
          SizedBox(
            height: 6.00,
          ),
          Text(
            this.title,
            style: TextStyle(fontSize: 24.00, fontWeight: FontWeight.bold),
          )
        ],
      ),
      
    );
  }
}
