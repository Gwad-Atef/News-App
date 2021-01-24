import 'package:flutter/material.dart';
import 'package:news_app/Home_Tabs/homescreen.dart';
import 'package:news_app/pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBorading extends StatefulWidget {
  @override
  _OnBoradingState createState() => _OnBoradingState();
}

class _OnBoradingState extends State<OnBorading> {
  ValueNotifier<int> _pageviewnotfire = ValueNotifier(0);
  List<PageModel> pages;

  void addPages() {
    pages = List<PageModel>();
    pages.add(PageModel('assets/1.jpeg', 'Welcome!',
        "First , Welcome To My App Have A Nice Exprement", Icons.ac_unit));
    pages.add(PageModel('assets/2.jpg', 'Welcome!',
        "Second , Have a Info about news ", Icons.accessibility));
    pages.add(PageModel(
        'assets/3.jpeg',
        'Welcome!',
        "thired , about world just do it now and subscruib with me",
        Icons.sentiment_satisfied));
    pages.add(PageModel(
        'assets/4.jpeg', 'Welcome!', "Lastest  Les's Do it , ", Icons.headset));
  }

  @override
  Widget build(BuildContext context) {
    addPages();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: ExactAssetImage(pages[index].images),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          pages[index].title,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50, left: 50, top: 50.0),
                        child: Text(
                          pages[index].discrabtion,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageviewnotfire.value = index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 175),
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicator(pages.length),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                  ),
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageviewnotfire,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
