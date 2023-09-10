import 'package:dio/dio.dart';
import 'package:store_app/helper/api_class.dart';
import 'package:store_app/models/product_model.dart';

class CategorieService {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categoryName}) async {
    Response response= await APi().get('https://fakestoreapi.com/products/category/:$categoryName');
      List<dynamic> jsonData = response.data;
      List<ProductModel> productList = [];
      for (var i = 0; i < jsonData.length; i++) {
        productList.add(
          ProductModel.fromJson(jsonData[i]),
        );
      }
      return productList;
    
  }
}
