import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BaseResponseDto<T> extends Equatable {
  
  late int resultCode;
  late String message;
  late T data;

  BaseResponseDto({required this.resultCode, required this.message, required this.data });

  BaseResponseDto.fromJson(Map<String, dynamic> json, Function parseModel) {
    resultCode = json['result'];
    message = json['message'];
    data = parseModel(json['data']);
  }
  
  @override
  List<Object?> get props => [resultCode, message, data];

}