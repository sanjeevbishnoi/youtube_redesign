import 'package:flutter/material.dart';
class VideoHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const VideoHeader({
    Key key,
    this.title,
    this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Text(
        "${this.title}",
        style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.w600),
        
      ),
      subtitle: Text(
        "${this.subtitle}",
        style: TextStyle(fontSize: 14.00, fontWeight: FontWeight.w400),
      ),
      );
  }
}
