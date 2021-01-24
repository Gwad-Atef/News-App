import 'dart:convert';

import 'package:http/http.dart' as Http;

import 'package:news_app/Models/post.dart';
import 'package:news_app/utilites/api_utilites.dart';

class PostsApi {
  Future<List<Post>>  featchPostsCategory(String sId) async {
    List<Post> posts = List<Post>();
    String allPostsCategoryURL = baseApiURL + apiPostsCategory + sId ;
    var response = await Http.get(allPostsCategoryURL);
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      var data = decodedJson["data"];
      for (var item in data) {
        Post post = Post(
          title: item["title"].toString(),
          id: item["id"].toString(),
          categoryId: item["categoryId"].toString(),
          content: item["content"].toString(),
          createdAt: item["created_at"].toString(),
          dateWritten: item["date_written"].toString(),
          featuredImage: item["featured_image"].toString(),
          updatedAt: item["updated_at"].toString(),
          userId: item["userId"],
          voteDown: item["vote_down"],
          voteUp: item["vote_up"],
          votersUp: (item["voters_up"] == null)
              ? List<int>()
              : jsonDecode(item["voters_up"]),
          votersDown: (item["voters_down"] == null)
              ? List<int>()
              : jsonDecode(item["voters_down"]),
        );
        posts.add(post);
      }

      for (Post post in posts) {
        print(post.id);
      }
    }
    return posts;
  }

  Future<List<Post>> featchAllPosts() async {
    List<Post> posts = List<Post>();
    String allPostsURL = baseApiURL + apiPostsURL;
    var response = await Http.get(allPostsURL);
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      var data = decodedJson["data"];
      for (var item in data) {
        Post post = Post(
          title: item["title"].toString(),
          id: item["id"].toString(),
          categoryId: item["categoryId"].toString(),
          content: item["content"].toString(),
          createdAt: item["created_at"].toString(),
          dateWritten: item["date_written"].toString(),
          featuredImage: item["featured_image"].toString(),
          updatedAt: item["updated_at"].toString(),
          userId: item["userId"],
          voteDown: item["vote_down"],
          voteUp: item["vote_up"],
        );
        posts.add(post);
      }

      for (Post post in posts) {
        print(post.id);
      }
    }
    return posts;
  }
}
