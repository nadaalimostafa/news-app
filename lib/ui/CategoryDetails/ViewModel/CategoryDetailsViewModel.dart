import 'package:flutter/cupertino.dart';
import 'package:news_app/remote/ApiManger.dart';

import '../../../remote/SourceResponse/Sources.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  String? error;
  bool isLoading = false ;
  List<Source> sources =[];
    getSources(category)async{
      error = null;
      sources = [];
      isLoading = true;
      notifyListeners();
      var response = await ApiManger.getSources(category);
      isLoading = false;
      if(response?.status =="error" ){
        error = response?.status;
        notifyListeners();
      }else{
        sources =  response?.sources ?? [];
        notifyListeners();
      }
    }
}