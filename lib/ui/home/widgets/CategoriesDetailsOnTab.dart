import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/CategoryDetails/ViewModel/CategoryDetailsViewModel.dart';
import 'package:news_app/ui/home/widgets/BodyTabBar.dart';
import 'package:provider/provider.dart';

class CategoriesDetailsOnTab extends StatefulWidget {
  String categoryId;

  CategoriesDetailsOnTab({super.key, required this.categoryId});

  @override
  State<CategoriesDetailsOnTab> createState() => _CategoriesDetailsOnTabState();
}

class _CategoriesDetailsOnTabState extends State<CategoriesDetailsOnTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryDetailsViewModel()..getSources(widget.categoryId),
      child: Consumer<CategoryDetailsViewModel>(
          builder: (BuildContext context, value, Widget? child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (value.error != null) {
          return TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Text(value.error!),
          );
        }
        return DefaultTabController(
          length: value.sources.length ?? 0,
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.all(10.0),
                child: TabBar(
                    labelColor: Colors.white,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    padding: REdgeInsets.symmetric(vertical: 10),
                    splashFactory: NoSplash.splashFactory,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    tabs: value.sources
                            .map((source) => Container(
                                  margin: REdgeInsets.symmetric(horizontal: 10),
                                  padding: REdgeInsets.symmetric(
                                    vertical: 1,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.r),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  child: Tab(
                                    child: Text(source.name ?? ""),
                                  ),
                                ))
                            .toList() ??
                        []),
              ),
              Expanded(
                child: TabBarView(
                    children: value.sources
                            .map((source) => BodyTabBar(
                                  sourceId: source.id ?? "",
                                ))
                            .toList() ??
                        []),
              ),
            ],
          ),
        );
      }),
    );
  }
}
