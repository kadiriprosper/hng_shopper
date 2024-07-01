class ProductModel {
  ProductModel({
    required this.name,
    required this.price,
    required this.imagePath,
  });
  String name;
  String price;
  String imagePath;

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'],
      price: data['price'],
      imagePath: data['imagePath'],
    );
  }
}
