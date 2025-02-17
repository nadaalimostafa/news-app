import 'package:flutter/cupertino.dart';
import 'package:news_app/remote/ApiManger.dart';
import 'package:news_app/remote/ArticlesResponse/Article.dart';

class NewsViewModel extends ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  List<Article>articles = [];
  getArticles(sourceId)async{
    try{
      isLoading = true;
      var response = await ApiManger.getArticles(sourceId);
      if(response?.status == "error"){
        isLoading = false ;
        errorMessage = response?.message;
        notifyListeners();
      }else{
        isLoading = false;
        articles = response?.articles ??[];
        notifyListeners();
      }

    }catch(error){
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }
  }
}