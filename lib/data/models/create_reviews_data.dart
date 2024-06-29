class CreateReviewsData {
  int? customerId;
  int? productId;
  String? description;
  int? rating;
  String? updatedAt;
  String? createdAt;
  int? id;

  CreateReviewsData(
      {this.customerId,
        this.productId,
        this.description,
        this.rating,
        this.updatedAt,
        this.createdAt,
        this.id});

  CreateReviewsData.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    productId = json['product_id'];
    description = json['description'];
    rating = json['rating'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['product_id'] = productId;
    data['description'] = description;
    data['rating'] = rating;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}