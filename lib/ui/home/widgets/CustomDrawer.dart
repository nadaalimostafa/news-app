import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/widgets/CategoriesTab.dart';
typedef selectTab = void Function(EnumTab);
class CustomDrawer extends StatelessWidget {
  selectTab changeTabs;
  CustomDrawer({required this.changeTabs});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.primary,
          height: 110.h,
          width: 326.w,
          child: Center(
              child: Text(
            "News App!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:35 .h,),
        InkWell(
          onTap: ()=>changeTabs(EnumTab.categoriesTab),
          child: Padding(
            padding: REdgeInsets.only(left: 24.0.w),
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 38.sp,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                    "Categories",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(height:15 .h,),
        InkWell(
          onTap: ()=>changeTabs(EnumTab.settingsTab),
          child: Padding(
            padding: REdgeInsets.only(left:24),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 38.sp,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
enum EnumTab{
  categoriesTab,
  settingsTab,
}