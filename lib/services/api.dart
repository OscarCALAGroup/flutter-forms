import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://localhost:7176/api/v1',
    headers: {
      'email': 'oscar@gmail.com',
      'password': '123456',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKV1RDQUxBQWNjZXNzVG9rZW4iLCJqdGkiOiIwMWRhYTdkMS0zYzZmLTQ2ZjEtOWQzYi1jNmFiZTk1YjU3NTAiLCJpYXQiOiIyMy82LzIwMjMgMTU6MzQ6MzYiLCJVc2VySWQiOiIxMSIsIlVzZXJOYW1lIjoiSmhvbiBQb2x0ZXIiLCJFbWFpbCI6ImRpc2Vub0BjYWxhZ3JvdXAuY29tLm14IiwiZXhwIjoxNjkwMTI2NDc2LCJpc3MiOiJKV1RDQUxBQXV0aGVudGljYXRpb25TZXJ2ZXIiLCJhdWQiOiJKV1RDQUxBU2VydmljZXMifQ.nd4oQxoXvWwz7RGUtjWbCgt2fk3H4mdzRUCXBHW4Cck',
    },
  ));

  static get dio => _dio;
}
