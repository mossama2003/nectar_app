class ProductsModel {
  final List<ProductData> data;

  ProductsModel({required this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
          data: List<ProductData>.from(
        json['data'].map((item) => ProductData.fromJson(item)),
      ));
}

class ProductData {
  final int id;
  final String name;
  final double price;
  final String image;
  bool isFav;

  ProductData({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isFav,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json['id'],
        name: json['name'],
        price: json['price']?.toDouble(),
        image: json['image'],
        isFav: json['is_favorite'],
      );
}
