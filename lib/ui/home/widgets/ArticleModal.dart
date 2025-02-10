import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../remote/ArticlesResponse/Article.dart';

class ArticleModal extends StatelessWidget {
  final Article articles;

  const ArticleModal({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: articles.urlToImage??"",
          height: 250.h,
          width: double.infinity,
          fit: BoxFit.cover,
          errorWidget: (context,utl,error)=> Icon(Icons.error),
          placeholder: (context,utl)=> Center(child: CircularProgressIndicator()),
        ),
        SizedBox(height: 10.h),
        Text(articles.source?.name??""),
        Text(articles.title??"" ,style: Theme.of(context).textTheme.bodyMedium,),
        Align(
          child: Text(timeago.format(DateTime.parse(articles.publishedAt??""))),
          alignment: Alignment.centerRight,
        ),
      ], 
    );
  }
}
