class CategoryList {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;

  CategoryList(
      {this.id,
        this.title,
        this.shortDes,
        this.price,
        this.image,
        this.productId,
        this.createdAt,
        this.updatedAt});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}