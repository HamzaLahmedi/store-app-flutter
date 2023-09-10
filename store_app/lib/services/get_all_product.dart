import 'package:store_app/helper/api_class.dart';
import 'package:store_app/models/product_model.dart';
import 'package:dio/dio.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    Response response = await APi().get('https://fakestoreapi.com/products');

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
