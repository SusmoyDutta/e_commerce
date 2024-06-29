class CardModel {
  int? productId;
  String? color;
  String? size;
  int? qty;

  CardModel({
    required this.productId,
    required this.color,
    required this.size,
    required this.qty,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "color ": color,
      "size'": size,
      "qty": qty,
    };
  }
}
