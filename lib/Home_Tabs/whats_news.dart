import 'dart:math';
import 'package:flutter/material.dart';
import 'package:news_app/Models/post.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/screens/singel_post.dart';
import 'package:news_app/utilites/data_utilites.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi postsAPI = PostsApi();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdate()
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);
    TextStyle _headerdisc = TextStyle(color: Colors.white, fontSize: 13.0);
    return FutureBuilder(
      future: postsAPI.featchPostsCategory("11"),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.done:
            if (snapshot.error != null) {
              return error(snapshot.error);
            } else {
              List<Post> posts = snapshot.data;
              Random random = Random();
              int randomIndex = random.nextInt(posts.length);
              Post post = posts[randomIndex];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SinglePost(post);
                  }));
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(post.featuredImage),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 48, left: 48),
                          child: Text(
                            post.title,
                            style: _headerTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34, right: 34),
                          child: Text(
                            post.content.substring(0, 75),
                            style: _headerdisc,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }

            break;
        }
        return Container();
      },
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.featchPostsCategory("1"),
                builder: (context, AsyncSnapshot snapShot) {
                  switch (snapShot.connectionState) {
                    case ConnectionState.waiting:
                      return loading();
                      break;
                    case ConnectionState.active:
                      return loading();
                      break;
                    case ConnectionState.none:
                      return connectionError();
                      break;
                    case ConnectionState.done:
                      if (snapShot.error != null) {
                        return error(snapShot.error);
                      } else {
                        if (snapShot.hasData) {
                          List<Post> posts = snapShot.data;
                          if (posts.length >= 3) {
                            Post post1 = snapShot.data[0];
                            Post post2 = snapShot.data[1];
                            Post post3 = snapShot.data[2];
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdate([deepOrange]) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
          future: postsAPI.featchPostsCategory('11'),
          builder: (context, AsyncSnapshot snapShot) {
            switch (snapShot.connectionState) {
              case ConnectionState.none:
                return connectionError();
                break;
              case ConnectionState.active:
                return loading();
                break;
              case ConnectionState.waiting:
                return loading();
                break;
              case ConnectionState.done:
                if (snapShot.hasError) {
                  return error(snapShot.error);
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, bottom: 8, top: 8),
                        child: _drawSectionTitle('Recent Update'),
                      ),
                      _drawRecentUpdate2(Colors.deepOrange, snapShot.data[0]),
                      _drawRecentUpdate2(Colors.teal, snapShot.data[1]),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  );
                }
                break;
            }
            return Container();
          }),
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          fontSize: 16.0),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }

  Widget _drawSingleRow(Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                post.featuredImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 7.0,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    post.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Michael Adams',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(
                        width: 1.0,
                        height: 11,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _drawRecentUpdate2(Color color, Post post) {
    return Card(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(post.featuredImage),
                  fit: BoxFit.cover,
                ))),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Container(
                padding:
                    EdgeInsets.only(left: 16.0, right: 16, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'SPORT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  Text(
                    parseHumanDateTime(post.dateWritten),
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
