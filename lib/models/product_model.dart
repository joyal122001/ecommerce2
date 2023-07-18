import 'package:store_api_flutter_course/models/categories_model.dart';

class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoriesModel? category;

  ProductModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.images,
        this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    category = json['category'] != null ? CategoriesModel.fromJson(json['category']) : null;
  }
  static List<ProductModel> productsFromSnapshot (List productSnapshot){
    //print("data ${productSnapshot[0]}");
    return productSnapshot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
}
