import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/modal/ArticleData.dart';
import 'package:news_app/ui/home/widgets/ArticleModal.dart';

class BodyTabBar extends StatelessWidget {
   static List<ArticleData> articles =  [
     ArticleData(
        articleText: "Why are football's biggest clubs starting a new tournament?",
        image: "https://media.istockphoto.com/id/1403500817/photo/the-craggies-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=",
        date: DateTime(
           2024,12,31
        ).add(Duration(days: 3)),
        source: "BBC"
    ),
     ArticleData(
         articleText: "Why are football's biggest clubs starting a new tournament?",
         image: "https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=",
         date: DateTime(2025,2,1).subtract(Duration(hours: 20)),
         source: "BBC"
     ),
     ArticleData(
         articleText: "Why are football's biggest clubs starting a new tournament?",
         image: "https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=",
         date:  DateTime(2025,2,1).subtract(Duration(hours: 20)),
         source: "BBC"
     ),
     ArticleData(
         articleText: "Why are football's biggest clubs starting a new tournament?",
         image: "https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=",
         date:DateTime(2025,2,1).subtract(Duration(hours: 20)),
         source: "BBC"
     ),
     ArticleData(
         articleText: "Why are football's biggest clubs starting a new tournament?",
         image: "https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=",
         date:DateTime(2025,2,1).subtract(Duration(hours:300)),
         source: "BBC"
     ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ArticleModal(
         articles: articles[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: articles.length,
    );
  }
}
