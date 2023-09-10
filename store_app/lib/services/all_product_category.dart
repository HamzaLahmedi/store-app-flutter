import 'package:dio/dio.dart';
import 'package:store_app/helper/api_class.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    Response response = await APi().get('https://fakestoreapi.com/products');

    List<dynamic> jsonData = response.data;

    return jsonData;
  }
}
