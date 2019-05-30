import 'package:firstcodingjob/pages/details/home.dart';
import 'package:flutter/material.dart';
import '../tabs/recent.dart';

class CollapsingTab extends StatefulWidget {
  @override
  _CollapsingTabState createState() => new _CollapsingTabState();
}

class _CollapsingTabState extends State<CollapsingTab> {
  ScrollController scrollController;

  Widget _buildActions() {
    Widget profile = new GestureDetector(
      onTap: () => showProfile(),
      child: new Container(
        height: 30.0,
        width: 45.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: new DecorationImage(
            image: new ExactAssetImage("assets/logo.png"),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
      ),
    );

    double scale;
    if (scrollController.hasClients) {
      scale = scrollController.offset / 300;
      scale = scale * 2;
      if (scale > 1) {
        scale = 1.0;
      }
    } else {
      scale = 0.0;
    }

    return new Transform(
      transform: new Matrix4.identity()..scale(scale, scale),
      alignment: Alignment.center,
      child: profile,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {

    var flexibleSpaceWidget = new SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text("Developer Libs",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              )),
          background: Image.asset(
            "assets/logo.png",
          )),
      actions: <Widget>[
        new Padding(
          padding: EdgeInsets.all(5.0),
          child: _buildActions(),
        ),
      ],
    );

    return Scaffold(
      body: new DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              flexibleSpaceWidget,
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.black26,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.account_box),
                        text: "Detail",
                      ),
                      Tab(icon: Icon(Icons.add_location), text: "Address"),
                      Tab(icon: Icon(Icons.monetization_on), text: "Earning"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              new HomePage(),
              new HomePage(),
              new HomePage(),
            ],
          ),
        ),
      ),
    );
  }
  
  showProfile() {
    Navigator.pushNamed(context, '/profile');
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}