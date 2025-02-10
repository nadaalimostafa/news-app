import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/remote/ArticlesResponse/ArticlesResponse.dart';
import 'package:news_app/remote/SourceResponse/SourceResponse.dart';
import 'package:news_app/remote/SourceResponse/Sources.dart';
class ApiManger{
  static Future <SourceResponse?> getSources(String category)async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=&cantegory=poltics
    try {
      Uri uri = Uri.https(
          "newsapi.org",
          "v2/top-headlines/sources", {
          "apiKey": "e2d1f6091bdd4a5c90af4b1e0e64cd3a",
         "category": category
      });
      var responce = await http.get(uri);

      var json = jsonDecode(responce.body);
      var SourceResponce = SourceResponse.fromJson(json);
      return SourceResponce;
    } catch (error) {
      print(error.toString());
    }
  }
  static Future<ArticlesResponse?> getArticles(String sourceId) async {

   try{
     Uri uri = Uri.https(
         "newsapi.org",
         "v2/everything",{
       "apiKey":"e2d1f6091bdd4a5c90af4b1e0e64cd3a"  ,
       "sources" : sourceId,
     });
     var response = await http.get(uri);
     var json = jsonDecode(response.body);
     var articlesResponse = ArticlesResponse.fromJson(json);
     return articlesResponse;
   }catch(error){
     print(error.toString());
   }
  }
}