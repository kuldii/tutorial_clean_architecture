import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetUser {
  final ProfileRepository profileRepository;

  const GetUser(this.profileRepository);

  Future<Either<Failure, Profile>> execute(int id) async {
    return await profileRepository.getUser(id);
  }
}
