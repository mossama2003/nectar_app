class AddToCartParams {
  final int productId;
  final int quantity;

  AddToCartParams({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
  };
}
