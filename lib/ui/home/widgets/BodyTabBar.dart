import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/remote/ApiManger.dart';
import 'package:news_app/ui/home/widgets/ArticleModal.dart';
import 'package:http/http.dart' as http;


class BodyTabBar extends StatefulWidget {
final String sourceId ;
BodyTabBar({required this.sourceId});

  @override
  State<BodyTabBar> createState() => _BodyTabBarState();
}

class _BodyTabBarState extends State<BodyTabBar> {
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: ApiManger.getArticles(widget.sourceId),
        builder: (context , snapshot){
          if(snapshot .hasError){
            return TextButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text("Refresh"),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }

          var response = snapshot.data;
          if (response?.status == "error") {
            return TextButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text(response?.message ?? ""),
            );
          }
          var articles = response?.articles??[];
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
            itemBuilder: (context, index) => ArticleModal(
             articles:articles[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: articles.length,
            ),
          );
        }
    );
  }
}
