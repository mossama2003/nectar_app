import 'cart_model.dart';

class FavModel {
  final List<Item> data;

  FavModel({
    required this.data,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        data: List<Item>.from(json["data"].map((x) => Item.fromMap(x))),
      );
}
