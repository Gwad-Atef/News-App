import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_drawer.dart';

class FacebookFeed extends StatefulWidget {
  @override
  _FacebookFeedState createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed> {
  List<int> ids = [];
  TextStyle _hashTagStyle = TextStyle(color: Colors.orange);

  @override
  void initState() {
    super.initState();
    ids = [0 , 2 , 5];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('FaceBook Feed'),
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
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(position),
                  _drawTitle(),
                  _drawHashTag(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                Text(
                  'Christina Meyers',
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 8,
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
        ),
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: (ids.contains(position) ) ? Colors.red : Colors.grey.shade400,
                ),
                onPressed: () {
                  setState(() {
                    if(ids.contains(position)){
                    ids.remove(position);
                  }else{
                    ids.add(position);
                  }
                  });
                }),
            Transform.translate(
              offset: Offset(-12, 0),
              child: Text(
                '25',
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13.0),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16.0, right: 16.0),
      child: Text(
        'We also talk about the future of work as the robots',
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: ExactAssetImage('assets/5.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              '10 comments',
              style: _hashTagStyle,
            )),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  'share',
                  style: _hashTagStyle,
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'open',
                  style: _hashTagStyle,
                )),
          ],
        )
      ],
    );
  }

  Widget _drawHashTag() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '#advance',
                style: _hashTagStyle,
              )),
        ],
      ),
    );
  }
}
