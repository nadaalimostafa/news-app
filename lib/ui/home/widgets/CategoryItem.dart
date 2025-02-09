import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/modal/CategoryData.dart';

class CategoryItem extends StatelessWidget {
  CategoryData modal;
  int index;
  void Function (String) openCategoryDetails;
  CategoryItem({super.key, required this.modal, required this.index, required this.openCategoryDetails});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        openCategoryDetails(modal.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: modal.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(index.isEven ? 25 : 0),
              bottomRight: Radius.circular(index.isOdd ? 25 : 0)),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/imges/${modal.imageName}",
              height: 127.h,
              width: 127.w,
            ),
            Text(
              modal.title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
