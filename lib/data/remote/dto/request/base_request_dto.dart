import 'package:equatable/equatable.dart';

abstract class BaseRequestDto extends Equatable{
   Map<String, dynamic> toJson();
}