class ProductModel {
  final String title;
  final String description;
  final int id;

  new({required this.title, required this.description, required this.id});

  factory ProductModel.fromJson(Map<String, dynamic> product) {
    return ProductModel(
      title: product['title'],
      description: product['description'],
      id: product['id'],
    );
  }
}
