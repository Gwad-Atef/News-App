import 'package:flutter/material.dart';
import 'package:news_app/Models/post.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/screens/singel_post.dart';
import 'package:news_app/utilites/data_utilites.dart';

class Papluar extends StatefulWidget {
  @override
  _PapluarState createState() => _PapluarState();
}

class _PapluarState extends State<Papluar> {
  PostsApi postsApi = PostsApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsApi.featchPostsCategory('1'),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return error(snapshot.error);
            } else {
              List<Post> posts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    child: _drawSingleRow(posts[position]),
                  );
                },
                itemCount: posts.length,
              );
            }
            break;
        }
        return Container();
      },
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SinglePost(post);
          }));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Image(
                image: NetworkImage(post.featuredImage),
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
                        style: TextStyle(fontSize: 10.0),
                      ),
                      SizedBox(
                        width: 5.0,
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.alarm),
                          Text(parseHumanDateTime(post.dateWritten))
                        ],
                      )
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
}
