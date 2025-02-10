import 'dart:ui';

class CategoryData {
   String title;
   String imageName;
   String id;
   Color color;

   CategoryData({
    required this.color,
    required this.title,
    required this.id,
    required this.imageName,
  });

  static List<CategoryData> categoryModal =  [
    CategoryData(color: const Color(0xffC91C22), title: "Sports", id: "sports", imageName: "ball.png"),
    CategoryData(color: const Color(0xff003E90), title: "General ", id: "general", imageName: "Politics.png"),
    CategoryData(color: const Color(0xffED1E79), title: "Health ", id: "health", imageName: "health.png"),
    CategoryData(color: const Color(0xffCF7E48), title: "Business ", id: "business", imageName: "business.png"),
    CategoryData(color: const Color(0xff4882CF), title: "Technology ", id: "technology", imageName: "environment.png"),
    CategoryData(color: const Color(0xffF2D352), title: "Science ", id: "science", imageName: "science.png"),

  ];
}