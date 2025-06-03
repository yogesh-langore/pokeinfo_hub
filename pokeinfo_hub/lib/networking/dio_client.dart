import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient();

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final dioProvider = Provider<DioClient>((ref) => DioClient());
