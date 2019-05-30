import 'package:firstcodingjob/pages/tabs/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './common/ui/app_page.dart';
import 'screens/tabs/recent.dart';
import 'pages/tabs/profile.dart';
import './components/fab_bottom_app_bar.dart';
import './components/layout.dart';
import './components/slide_route.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'FirstCodingJob',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyHomePage(title: 'FirstCodingJob'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
 
 List<AppPage> _items;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  _items = [
      new AppPage(
          icon: new Icon(Icons.home,color: Colors.red,),
          title: 'Home',
          color: Colors.white,
          body: HomePage(),
          vsync: this),
      new AppPage(
        icon: new Icon(Icons.info,color: Colors.teal.shade400,),
        title: 'Trending',
        color: Colors.white,
        body: new HomePage(),
        vsync: this,
      ),
      new AppPage(
        icon: new Icon(Icons.bookmark,color: Colors.teal,),
        title: 'Saved',
        color: Colors.white,
        body: new HomePage(),
        vsync: this,
      ),
      new AppPage(
        icon: new Icon(Icons.supervised_user_circle,color: Colors.blueAccent.shade400,),
        title: 'Account',
        color: Colors.white,
        body: new Profile(),
        vsync: this,
      ),
    ];

    for (AppPage view in _items) view.controller.addListener(_rebuild);

    _items[_currentIndex].controller.value = 1.0;
  }

  void _rebuild() {
    setState(() {});
  }

  Widget _buildPageStack() {
    final List<Widget> transitions = <Widget>[];
    int itemLength=_items.length;
    for (int i = 0; i < itemLength; i++) {
      transitions.add(IgnorePointer(ignoring: _currentIndex != i, child: _items[i].buildTransition(context)));
    }
    return new SafeArea(child:Stack(children: transitions));
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "YouTube",
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: -1.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              Icons.videocam,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              Icons.search,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              Icons.account_circle,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: new Center(
        child: _buildPageStack(),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Search',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (int){
          setState(() {
          _items[_currentIndex].controller.reverse();
          _currentIndex = int;
          _items[_currentIndex].controller.forward();
        });
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.trending_up, text: 'Trending'),
          FABBottomAppBarItem(iconData: Icons.bookmark, text: 'Saved'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Account'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),// This trailing comma makes auto-formatting nicer for build methods.
    );
    
  }
  
  @override
  void dispose() {
    for (AppPage page in _items) {
      page.controller.dispose();
    }
    super.dispose();
  }

  Widget _buildFab(BuildContext context) {
    
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return Container(width: 0.0,height:0.0,);
      },
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, SlideTopRoute(page: Search()));
         },
        tooltip: 'Search',
        child: Icon(Icons.search),
        elevation: 2.0,
      ),
    );
  }
  
}
