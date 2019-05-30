  import 'package:flutter/material.dart';

enum ClipType { pointed, curved, arc, traingle, waved }

class ZigZag extends StatelessWidget {
  Widget child;
  ClipType clipType;

  ZigZag({this.child, this.clipType = ClipType.curved});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ZigZagClipper(clipType),
      child: child,
    );
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  ClipType clipType;

  ZigZagClipper(this.clipType);

  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    if (clipType == ClipType.pointed)
      createPointedTraingle(size, path);
    else if (clipType == ClipType.arc)
      createBeziarArc(size, path);
    else if (clipType == ClipType.traingle) {
      createTriangle(size, path);
    }else if (clipType == ClipType.waved) {
      createWave(size, path);
    }
    else
      createCurve(size, path);

    path.close();
    return path;
  }

  createTriangle(Size size, Path path) {
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
  }

  createArc(Size size, Path path) {
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
  }

  createBeziarArc(Size size, Path path) {
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
  }

  createCurve(Size size, Path path) {
    path.lineTo(0, size.height);

    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 20;
    while (curXPos < size.width) {
      curXPos += increment;
      path.arcToPoint(Offset(curXPos, curYPos), radius: Radius.circular(5));
    }
    path.lineTo(size.width, 0);
  }

  createPointedTraingle(Size size, Path path) {
    path.lineTo(0, size.height);

    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 40;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 30 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
  }

  createWave(Size size, Path path){
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height, size.width, size.height-30);
    path.lineTo(size.width, 0);

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}