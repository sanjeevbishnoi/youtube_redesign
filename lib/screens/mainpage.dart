import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/custom_clipper/zigzag.dart';
import './tabs/recent.dart';
class MainPage extends StatelessWidget {
  MainPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(top: 0.0,
          child: ZigZag(clipType: ClipType.waved ,child: BluredHeader())
        ),
        Positioned.fill(
          top: 160.00,
          child:
        HomePage())
        ],
      ),
    );
  }
}

class BluredHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        child: new MastHead(),
        
        width: MediaQuery.of(context).size.width,height: 200.00,color: Colors.amber.withOpacity(0.6)
      
      
      );
    
  }
}

class MastHead extends StatelessWidget {
  const MastHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text('Entreprenur',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24.00),),
       Text('Be the brightest in Future',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16.00),),
      SizedBox(height: 10,),
      new Category()
    ]));
  }
}

class Category extends StatelessWidget {

  const Category({
    Key key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height:40.00,
    child:
    ListView.builder(
      itemBuilder: (BuildContext ctx, int index){
        return new CategoryItem();
      },
      scrollDirection: Axis.horizontal,
      itemCount: 10,
    ));
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
      color:Color.fromRGBO(58, 66, 86, 1.0), child: Center(child:Padding(padding: EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),child: Text('Home',style: TextStyle(color: Colors.white),)),));
  }
}