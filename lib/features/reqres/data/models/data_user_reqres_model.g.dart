// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_reqres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserReqresModel _$DataUserReqresModelFromJson(Map<String, dynamic> json) =>
    DataUserReqresModel(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$DataUserReqresModelToJson(
        DataUserReqresModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
