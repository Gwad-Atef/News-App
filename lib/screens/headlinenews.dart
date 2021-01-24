import 'package:flutter/material.dart';
import 'package:news_app/Home_Tabs/fav.dart';
import 'package:news_app/Home_Tabs/papluar.dart';
import 'package:news_app/screens/navigation_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeadLineNews'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Text(
                "What's New",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
              ),
            ),
            Tab(
              child: Text(
                "PAPLUAR",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "FAVORITES",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          controller: _tabController,
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [Favorites(), Papluar(), Favorites()],
          controller: _tabController,
        ),
      ),
    );
  }
}
