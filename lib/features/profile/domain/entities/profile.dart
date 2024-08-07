import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Profile extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String profileImageUrl;

  const Profile({
    required this.id,
    required this.email,
    required this.fullName,
    required this.profileImageUrl,
  });

  @override
  List<Object> get props => [
        id,
        email,
        fullName,
        profileImageUrl,
      ];
}
