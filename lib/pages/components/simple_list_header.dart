import 'package:flutter/material.dart';

class SimpleListHeader extends StatelessWidget {
  final String category, title, subtitle;
  SimpleListHeader(
    this.category,
    this.title,
    this.subtitle,
  ) : super();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
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
      subtitle: Text(this.subtitle,
          style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w500)),
    );
  }
}
