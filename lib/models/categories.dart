class Category {
  final String category;

  Category({
    required this.category,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(category: json['category']);
  }
}
