import 'package:sales_app/data/models/product_model.dart';

class CartModel {
  
  String? id;
  List<ProductModel> ?products;
  num ?price;

  CartModel({
    required this.id, 
    required this.products, 
    required this.price 
    });
}