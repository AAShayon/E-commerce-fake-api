class CategoryModel{
  final String categoryName;
  final String imageUrl;
  CategoryModel({required this.categoryName,required this.imageUrl});
}

final List<CategoryModel> categories=[
  CategoryModel(categoryName: 'electronics', imageUrl: 'assets/electronics.png'),
  CategoryModel(categoryName: 'jewelery', imageUrl: 'assets/jewelery.png'),
  CategoryModel(categoryName: "men's clothing", imageUrl: "assets/men's clothing.png"),
  CategoryModel(categoryName: "women's clothing", imageUrl: "assets/women's clothing.png"),
];