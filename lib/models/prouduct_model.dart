class ProuductModel {
  final int id;
  final String title;
  final String description;

  new({required this.id, required this.title, required this.description});

  factory ProuductModel.fromJson(Map<String, dynamic> product) {
    return ProuductModel(
      id: product['id'],
      title: product['title'],
      description: product['description'],
    );
  }

}
