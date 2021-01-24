import 'package:flutter/material.dart';
import 'package:news_app/Home_Tabs/fav.dart';
import 'package:news_app/Home_Tabs/papluar.dart';
import 'package:news_app/Home_Tabs/whats_news.dart';
import 'package:news_app/screens/Pages/about.dart';
import 'package:news_app/screens/Pages/contact.dart';
import 'package:news_app/screens/Pages/help.dart';
import 'package:news_app/screens/Pages/settings.dart';
import 'package:news_app/screens/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
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
                "POPLUAR",
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
          _popOutMenu(),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [WhatsNew(), Papluar(), Favorites()],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popOutMenu() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('SETTINGS'),
          )
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch (menu) {
          case PopOutMenu.ABOUT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));

            break;
          case PopOutMenu.SETTINGS:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
            break;
          case PopOutMenu.CONTACT:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ContactUs();
            }));
            break;
          case PopOutMenu.HELP:
          Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
        }
      },
    );
  }
}
