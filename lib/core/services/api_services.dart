import 'package:dio/dio.dart';
import 'package:talabi/config.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Config.baseUrl,
      headers: {
        'apikey': Config.apiKey,
        'Authorization': Config.authorization,
      },
    ),
  );
  //method to get data from supabase
  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }
  //method to post data to supabase

  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }
  //method to update data in supabase

  Future<Response> updateData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }
  //method to remove data in supabase

  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }
}
