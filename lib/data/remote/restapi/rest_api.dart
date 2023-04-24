import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sales_app/data/remote/dto/response/base_response_dto.dart';
import 'package:sales_app/data/remote/restapi/dio_client.dart';

import '../dto/request/base_request_dto.dart';

class RestApi {
  
  late Dio _dio;
  
  RestApi(){
    _dio = DioClient.instance.dio;
  }

  Future<BaseResponeDto?> sendGetAsync(String url, BaseRequestDto request) async {
    final body = jsonEncode(request.toJson());
    var rs = await _dio.get<BaseResponeDto>(url, data: body);
    return rs.data;
  }

    Future<BaseResponeDto?> sendPostAsync(String url, BaseRequestDto request) async {
    final body = jsonEncode(request.toJson());
    var rs = await _dio.post(url, data: body);
    return rs.data;
  }
}