
class Product {
  final String sku;
  final String productName;
  final String productImage;
  final int productRating;
  final String actualPrice;
  final String offerPrice;
  final String discount;

  Product({
    required this.sku,
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sku: json['sku'],
      productName: json['product_name'],
      productImage: json['product_image'],
      productRating: json['product_rating'],
      actualPrice: json['actual_price'],
      offerPrice: json['offer_price'],
      discount: json['discount'],
    );
  }
}