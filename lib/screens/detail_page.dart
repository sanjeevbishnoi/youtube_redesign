import 'package:firstcodingjob/components/search/videoheader.dart';
import 'package:flutter/material.dart';
import '../models/video.dart';
import './../components/search/videolist.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  final Video lesson;
  final List<String> links = [
    "iMEhjsiHbwM",
    "vZPOiMzUBCE",
    "aJOTlE1K90k",
    "pRpeEdMmmQ0",
    "GXoErccq0vw",
    "iMEhjsiHbwM",
    "vZPOiMzUBCE",
    "aJOTlE1K90k",
    "pRpeEdMmmQ0",
    "GXoErccq0vw"
  ];
  DetailPage({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    _scrollViewController = new ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: _buildScaffoldContent(context));
  }

  Widget _buildScaffoldContent(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: NestedScrollView(
                reverse: false,
                controller: _scrollViewController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 240,
                      primary: true,
                      floating: innerBoxIsScrolled,
                      pinned: false,
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: _buildSliverAppBarContent(),
                    ),
                    SliverPersistentHeader(
                      floating: false,
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                            controller: controller,
                            indicatorWeight: 2.0,
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0),
                            indicatorColor: Colors.red,
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(text: 'Details'),
                              Tab(text: 'Comments'),
                            ]),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    DetailsTab(widget: widget),
                    Center(child: Padding(padding:EdgeInsets.all(16.00),child: Text("Comments comes here,layout seems great,only betterment was to split it into tabs so that user not have to scroll too much to put comment")),)
                  ],
                ))));
  }

  FlexibleSpaceBar _buildSliverAppBarContent() {
    return FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            widget.lesson.link,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.15, 0.5],
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          Icon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
              size: 48.00,
            ),
        Positioned(bottom: 0.0,child: Container(height:20.00,color:Colors.red[400].withOpacity(0.7),width: MediaQuery.of(context).size.width,child: Center(child:Text("Auto Looping feature can be added in player",style: TextStyle(color: Colors.white,fontSize: 12.00)),),)),
     
    

        ],
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  const DetailsTab({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailPage widget;

  @override
  Widget build(BuildContext context) {
    return VideoList(
        videoHeader: VideoHeader(
            title: widget.lesson.title, subtitle: widget.lesson.title),
        links: widget.links);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
