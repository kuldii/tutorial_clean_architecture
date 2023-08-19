import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/data_user_reqres.dart';

part 'data_user_reqres_model.g.dart';

@JsonSerializable()
class DataUserReqresModel extends DataUserReqres {
  const DataUserReqresModel({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required String avatar,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          email: email,
          avatar: avatar,
        );

  factory DataUserReqresModel.fromJson(Map<String, dynamic> json) => _$DataUserReqresModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserReqresModelToJson(this);
}
