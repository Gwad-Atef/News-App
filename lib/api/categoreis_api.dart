import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Models/category.dart';
import 'package:news_app/utilites/api_utilites.dart';


class CategoriesAPI{


  Future<List<Category>> fetchCategories () async{
    List<Category> categories = List <Category>();
    String categoriesUrl = baseApiURL + apiAuthorsURL ;

    var response = await http.get(categoriesUrl);
  
    if(response.statusCode == 200){
      var jsonDate = jsonDecode(response.body);
      var data = jsonDate['data'];

      for(var item in data){
        Category category = Category(item['id'].toString(), item['title'].toString());
        categories.add(category);
      }
    }

    return categories;
  }
}