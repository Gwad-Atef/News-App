import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.indigo,
    Colors.brown,
    Colors.purple
  ];

  Random random = Random();
  Color _getRandomColr() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _autherRow(),
                SizedBox(
                  height: 16.0,
                ),
                _newsItemRow(),
                Row(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _autherRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/5.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Micheal Adams',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15 Min',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Life Style',
                      style: TextStyle(color: _getRandomColr()),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                    'assets/5.png',
                  ),
                  fit: BoxFit.cover)),
          width: 124,
          height: 124,
          margin: EdgeInsets.only(right: 16.0),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                'Tech Tent : Old phones and safe social',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'We also talk about the future of work as the robots advance , and we ask whether a retro phone',
                style:
                    TextStyle(color: Colors.grey, fontSize: 12, height: 1.25),
              )
            ],
          ),
        )
      ],
    );
  }
}
