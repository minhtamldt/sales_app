import 'package:equatable/equatable.dart';

class ApiResponse<T> {
  final int? statusCode;
  final String? statusMessage;
  final T? data;
  bool isSuccess() => statusCode == 200;
  ApiResponse({required this.statusCode, required this.statusMessage, required this.data});
}