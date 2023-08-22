import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/data_user_reqres.dart';

part 'data_user_reqres_model.g.dart';

@JsonSerializable()
class DataUserReqresModel extends DataUserReqres {
  @JsonKey(name: "first_name")
  @override
  // ignore: overridden_fields
  final String firstName;

  @JsonKey(name: "last_name")
  @override
  // ignore: overridden_fields
  final String lastName;

  const DataUserReqresModel({
    required int id,
    required String email,
    required this.firstName,
    required this.lastName,
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
