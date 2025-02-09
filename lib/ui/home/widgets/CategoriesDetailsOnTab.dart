import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/widgets/BodyTabBar.dart';

class CategoriesDetailsOnTab extends StatelessWidget {
  String categoryId;

  List<String> sources = [
    "tabbar ",
    "tabbar ",
    "tabbar ",
    "CBC",
    "ABCtabbar ",
    "tabbar ",
    "tabbar ",
    "CBC",
    "ABC"
  ];

  CategoriesDetailsOnTab({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: REdgeInsets.all(10),
        child: Column(
          children: [
            TabBar(
              dividerHeight: 0,
              indicatorWeight: 5,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: REdgeInsets.all(0),
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25.r),
              ),
              isScrollable: true,
              tabs: sources
                  .map((e) => Container(
                  margin:REdgeInsets.symmetric(horizontal: 10) ,
                  padding: REdgeInsets.symmetric(horizontal: 20,vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.primary)),
                      child: Tab(
                        child: Text(e),
                      )))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                  children:sources.map((e)=>BodyTabBar()).toList()

              ),
            )
          ],
        ),
      ),
    );
  }
}
