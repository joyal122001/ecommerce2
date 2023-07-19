import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/product_model.dart';

  class APIHandler {
    static Future<List<dynamic>> getData ({required String target})async{
      var uri = Uri.https(BASE_URL,"api/v1/$target",);
      var response=
      await  http.get(uri);
      var data = jsonDecode(response.body);
      List tempList = [];
      for(var v in data){
        tempList.add(v);
      }
      return tempList;
    }
    static  Future<List<ProductModel>> getAllProducts ()async{
      List temp =await getData(target: "products");
      return ProductModel.productsFromSnapshot(temp);
  }
  static  Future<List<CategoriesModel>> getAllCategories ()async{
      List temp =await getData(target: "categories");
      return CategoriesModel.categoriesFromSnapshot(temp);
  }

    static Future<ProductModel> getProductById ({required String id})async{
      var uri = Uri.https(BASE_URL,"api/v1/products/$id",);
      var response=
      await  http.get(uri);
      var data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    }
}
