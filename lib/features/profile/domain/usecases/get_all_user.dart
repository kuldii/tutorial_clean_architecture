import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetAllUser {
  final ProfileRepository profileRepository;

  const GetAllUser(this.profileRepository);

  Future<Either<Failure, List<Profile>>> execute(int page) async {
    return await profileRepository.getAllUser(page);
  }
}
