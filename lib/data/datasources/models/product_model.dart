class ProductModel {
  
  String? id;
  String? name;
  String? address;
  num? price;
  String? imageUrl;
  num? quantity;
  List<String>? gallery;

  ProductModel({
      required this.id,
      required this.name,
      required this.address,
      required this.price,
      required this.imageUrl,
      required this.quantity,
      required this.gallery
  });
}