
import 'products_model.dart';

class CartModel {
  final Data data;

  CartModel({
    required this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final int id;
  List<Item> items;

  Data({
    required this.id,
    required this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
  );
}

class Item {
  int id;
  final ProductData product;
  int quantity;

  Item({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"],
    product: ProductData.fromJson(json["product"]),
    quantity: json["quantity"]?? 0,
  );

}

