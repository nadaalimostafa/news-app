import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/widgets/CategoriesDetailsOnTab.dart';
import 'package:news_app/ui/home/widgets/CategoriesTab.dart';
import 'package:news_app/ui/home/widgets/CustomDrawer.dart';
import 'package:news_app/ui/home/widgets/SettingsTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late Widget selectedTab ;
  @override
  void initState() {
    super.initState();
    selectedTab = CategoriesTab(openCategoryDetails:currentCategory);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/imges/background.png"),
                fit: BoxFit.fill
            ),
            color: Colors.white
        ),
      child: Scaffold(
        drawer: Drawer(
          width: 326.w,
          child: CustomDrawer(
            changeTabs: currentTab,
          ),
        ),
        appBar: AppBar(
          title:const Text("News Title")
        ),
        body: selectedTab,
      ),
    );
  }

 currentTab(EnumTab tab){
    switch(tab){
      case EnumTab.categoriesTab:{
        selectedTab = CategoriesTab(openCategoryDetails:currentCategory);
      };
      case EnumTab.settingsTab:{
        selectedTab = SettingsTab();
      }
    }
    setState(() {});
    Navigator.pop(context);
 }
 currentCategory(String id){
    selectedTab = CategoriesDetailsOnTab(categoryId: id);
    setState(() {});
 }
}