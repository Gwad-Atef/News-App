import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Twitter Feed'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Card(
              child: Column(
                children: <Widget>[_cardHeader(), _cardBody(),
                _drawLine(),
                 _cardFooter()],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 24,
            backgroundImage: ExactAssetImage('assets/5.png'),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Christina Meyers' , style: TextStyle(
                 color: Colors.grey.shade900, 
                 fontSize: 16.0,
                 fontWeight: FontWeight.w600
               ),),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '@ch_meyres',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Fri , 12 May 2017 - 14.30',
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
      child: Text(
        'We also talk about the future of work as the robots advance , and we ask whether a retro phone',
        style: TextStyle(
          fontSize: 14.0 , 
          height: 1.2,
          color: Colors.grey.shade900
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.repeat , size: 28,),
                
                color: Colors.orange,
              ),
              Text('25' , style: TextStyle(
                 color: Colors.grey, 
                 fontSize: 16.0
               ),),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SHARED',
                    style: TextStyle(color: Colors.orange),
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'OPEN',
                    style: TextStyle(color: Colors.orange),
                  )),
            ],
          )
        ],
      ),
    );
  }

 Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16.0 ),
    );
  }
}
