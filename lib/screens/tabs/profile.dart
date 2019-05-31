import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            
            leading: Icon(Icons.account_circle,size: 56.00,color: Colors.red,),
          title: Text("Sanjeev Bishnoi",style:TextStyle(fontSize: 18.00,fontWeight: FontWeight.w600)),subtitle:Text("Email : er.sanjeevbishnoi@gmail.com"),),
           Divider(),
          ListTile(title: Text("My Watch Points",style:TextStyle(fontSize: 16.00,fontWeight: FontWeight.w600)),subtitle:Text("You are doing great, Total watch Time : 1000 Hrs."), isThreeLine: false, trailing: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("100",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600),),Text("Points",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600))],)),
          
          Divider(),
           ListTile(title: Text("Video from my subscriptions",style:TextStyle(fontSize: 16.00,fontWeight: FontWeight.w600)),subtitle:Text("Put all thing related to me on this page"),),
          new HrListView(title:"Watch History",icon: FontAwesomeIcons.youtube,),
          Divider(),
          ListTile(title: Text("Personalize",style:TextStyle(fontSize: 16.00,fontWeight: FontWeight.w600)),subtitle:Text("Choose your interest to show as feed on home and trending trending"),),
          Padding(padding:EdgeInsets.only(left:8.00), child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                child: Wrap(
                  spacing: 10,
                  children: _getTagsAsChipWidgets(),
                ),
              ),
            )),

           Divider(),
          ListTile(title: Text("Be a creator",style:TextStyle(fontSize: 16.00,fontWeight: FontWeight.w600)),subtitle:Text("Complete step by step guide to make money from youtube"),trailing: Icon(Icons.link,color: Colors.lightBlue,),),
          Divider(),
          ListTile(title: Text("Don't disturb ",style:TextStyle(fontSize: 16.00,fontWeight: FontWeight.w600)),subtitle:Text("It is my metime, no notification from any channel"),trailing: Switch(value: true),),
          Divider(),
          


        ],
      )
    );
  }

   List<Widget> _getTagsAsChipWidgets() {
    List<String> topics=["Art","Science","Technology","Startup","Business","Entertainment","Flutter"];    
    return topics.map((tag) {
      return Chip(
        backgroundColor: Colors.green,
        label: Text(tag,style: TextStyle(color:Colors.white),),
      );
    }).toList();
  }
}

class HrListView extends StatelessWidget {
  final String title;
  final IconData icon;
  const HrListView({
    this.title,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.00),
      child:
  
        Container(height:48.00,
        child:ListView.separated(separatorBuilder: (BuildContext context,int index){
          return SizedBox(width:10.00);
        }, scrollDirection: Axis.horizontal,itemBuilder:(BuildContext context,int index){
      return Icon(
        this.icon,
        color: Colors.red,
        size: 48.00,
      );
    },itemCount: 10),));
  }

 
}