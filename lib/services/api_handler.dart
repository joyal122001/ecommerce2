import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../consts/api_consts.dart';
import '../models/categories_model.dart';
import '../models/product_model.dart';


  class APIHandler {
    static Future<List<dynamic>> getData ({required String target, String? limit})async{
      try{
        var uri = Uri.https(BASE_URL,"api/v1/$target",);
        target == "products" ?
        {"offset": "0",
        "limit": limit} :{};
        var response=
        await  http.get(uri);
        var data = jsonDecode(response.body);
        List tempList = [];
        if(response.statusCode != 200){
          throw data["message"];
        }
        for(var v in data){
          tempList.add(v);
        }
        return tempList;
      }
      catch(error){
        log("an error occured $error");
        throw error.toString();
      }
    }
    static  Future<List<ProductModel>> getAllProducts ({required String limit})async{
      List temp =await getData(target: "products", limit: limit);
      return ProductModel.productsFromSnapshot(temp);
  }
  static  Future<List<CategoriesModel>> getAllCategories ()async{
      List temp =await getData(target: "categories");
      return CategoriesModel.categoriesFromSnapshot(temp);
  }

    static Future<ProductModel> getProductById ({required String id})async{
      try{
        var uri = Uri.https(BASE_URL,"api/v1/products/$id",);
        var response=
        await  http.get(uri);
        var data = jsonDecode(response.body);
        return ProductModel.fromJson(data);
      }
      catch(error){
        log("an error occured $error");
        throw error.toString();
      }
    }
}
