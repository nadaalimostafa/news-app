import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/widgets/BodyTabBar.dart';

import '../../../remote/ApiManger.dart';

class CategoriesDetailsOnTab extends StatefulWidget {
  String categoryId;
  CategoriesDetailsOnTab({super.key, required this.categoryId});

  @override
  State<CategoriesDetailsOnTab> createState() => _CategoriesDetailsOnTabState();
}

class _CategoriesDetailsOnTabState extends State<CategoriesDetailsOnTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManger.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text("Refresh"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          print(response?.sources?[0].id);
          return DefaultTabController(
            length: response?.sources?.length ?? 0,
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.all(10.0),
                  child: TabBar(
                      labelColor: Colors.white,
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorSize:  TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.black,
                      indicatorColor : Colors.transparent,
                      padding: REdgeInsets.symmetric(vertical: 10),
                      splashFactory:NoSplash.splashFactory,
                      indicator : BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      tabs: response?.sources?.map((source) =>
                          Container(
                            margin: REdgeInsets.symmetric(horizontal: 10),
                            padding: REdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                border: Border.all(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .primary
                                )
                            ),
                            child: Tab(
                              child: Text(source.name ?? ""),
                            ),
                          )).toList() ?? []
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      children: response?.sources?.map((source) => BodyTabBar(
                        sourceId: source.id??"",
                      ))
                          .toList() ?? []
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}