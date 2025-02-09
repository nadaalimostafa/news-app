import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/widgets/CategoryItem.dart';

import '../../../modal/CategoryData.dart';

class CategoriesTab extends StatelessWidget {
  void Function (String) openCategoryDetails;
  CategoriesTab({required this.openCategoryDetails});
  //CategoryData.categoryModal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 30, right: 30, top:30,bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            """Pick your Category
of interested """,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.h,
                childAspectRatio: 1/1.2,
              ),
              itemBuilder: (context, index) => CategoryItem(
                modal: CategoryData.categoryModal[index],
                index: index,
                openCategoryDetails: openCategoryDetails,
              ),
              itemCount: CategoryData.categoryModal.length,
            ),
          )
        ],
      ),
    );
  }
}
