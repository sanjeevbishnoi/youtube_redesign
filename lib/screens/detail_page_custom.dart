import 'package:firstcodingjob/components/search/videoheader.dart';
import 'package:flutter/material.dart';
import '../models/video.dart';
import './../components/search/videolist.dart';

class DetailPage extends StatefulWidget {
  final Video lesson;
  final List<String> links=["iMEhjsiHbwM","vZPOiMzUBCE","aJOTlE1K90k","pRpeEdMmmQ0","GXoErccq0vw","iMEhjsiHbwM","vZPOiMzUBCE","aJOTlE1K90k","pRpeEdMmmQ0","GXoErccq0vw"];
  DetailPage({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
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
    // CustomScrollView can hold multiple Slivers which have custom scrolling effects
    // A Sliver is simply a portion of a scrollable area.
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 240,
          pinned: false,
          floating: true,
          forceElevated: true,
          flexibleSpace: _buildSliverAppBarContent(),
           
        ),
        _buildPageBody(context)
      ],
    );
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
        


        ],
      ),
    );
  }

  Widget _buildPageBody(BuildContext context) {
    return _buildVideoDetailList(context);
  }

  Widget _buildVideoDetailList(BuildContext context) {
    return new SliverFillRemaining(
        child: Scaffold(
          appBar:PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child:new TabBar(
              tabs: [
                new Tab(child:Text('Details',style: TextStyle(color:Colors.black),)),
                 new Tab(child:Text('Comments',style: TextStyle(color:Colors.black),)),
              ],
              controller: controller,
            )),
        
        body:
        TabBarView(
          controller: controller,
          children: <Widget>[
               DetailsTab(widget: widget),
               Center(child: Text("Comments comes here,layout seems great"),)
             ],
            )));
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
    return VideoList(videoHeader: VideoHeader(title:widget.lesson.title,subtitle:widget.lesson.title),links: widget.links);
  }
}
