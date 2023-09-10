import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APi {
  Future<Response> get(String url) async {
    final dio = Dio();
    final Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
    String url, {
    @required dynamic body,
  
  }) async {
    
    final dio = Dio();
    
    Response response = await dio.post(url, data: body);
   if (response.statusCode==200) {
      Map<String,dynamic> data =response.data;
    return data;
   }else{
    throw Exception('there was an error satatus code = ${response.statusCode}');
   }
  }
  Future<dynamic> put(
    String url, {
    @required dynamic body,
  
  }) async {
    
    final dio = Dio();
    
    Response response = await dio.put(url, data: body);
   if (response.statusCode==200) {
      Map<String,dynamic> data =response.data;
      print(data);
    return data;
   }else{
    throw Exception('there was an error satatus code = ${response.statusCode}');
   }
  }
}
