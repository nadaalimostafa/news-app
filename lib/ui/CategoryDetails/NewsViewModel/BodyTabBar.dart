import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/remote/ApiManger.dart';
import 'package:news_app/ui/CategoryDetails/NewsViewModel/NewsViewModel.dart';
import 'package:news_app/ui/home/widgets/ArticleModal.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class BodyTabBar extends StatelessWidget {
final String sourceId ;
BodyTabBar({required this.sourceId});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
        create: (context)=>NewsViewModel()..getArticles(sourceId),
        child:Consumer<NewsViewModel>(
            builder: (context,viewModel , child){
              if(viewModel.isLoading){
                 return Center(child: CircularProgressIndicator(),);
              }if(viewModel.errorMessage != null){
                return TextButton(
                onPressed: () {
                  viewModel.getArticles(sourceId);
                },
              child: Text("Refresh"),
            );
              }
              return Padding(
             padding: REdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
            itemBuilder: (context, index) => ArticleModal(
             articles:viewModel.articles[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount:viewModel.articles.length,
            ),
          );
            }
        ),
    ) ;
  }
}
