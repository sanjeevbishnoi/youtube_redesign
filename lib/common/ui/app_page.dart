import 'package:flutter/material.dart';
class AppPage {
  AppPage({Widget icon, String title, Color color, this.body, TickerProvider vsync})
      : this._icon = icon,
        this._title = title,
        this._color = color,
        this.controller = new AnimationController(vsync: vsync, duration: Duration(milliseconds: 300)),
        this.item = new BottomNavigationBarItem(
          icon: icon,
          title: new Text(title,style: TextStyle(color:Colors.black)),
          backgroundColor: color,
        ) {
    _animation = new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
  }

  final Widget _icon;
  final String _title;
  final Color _color;
  final AnimationController controller;
  final BottomNavigationBarItem item;
  final Widget body;
  CurvedAnimation _animation;

  FadeTransition buildTransition(BuildContext context) {
    return new FadeTransition(
      opacity: _animation,
      child: body,
    );
  }
}