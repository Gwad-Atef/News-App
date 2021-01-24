import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/Models/author.dart';
import 'package:news_app/utilites/api_utilites.dart';

class AuthorsAPI {
  Future<List<Author>> featchAllAuthors() async {
    List<Author> authors = List<Author>();
    String allAuthorsApi = baseApiURL + apiAuthorsURL;

    var response = await http.get(allAuthorsApi);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];

      for (var item in data) {
        authors.add(Author(
          id: item["id"].toString(),
          name: item["name"].toString(),
          avatar: item["avatar"].toString(),
          email: item["email"].toString(),
        ));
      }
    }
    return authors;
  }
}
