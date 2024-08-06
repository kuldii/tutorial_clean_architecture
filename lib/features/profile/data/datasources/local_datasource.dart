import 'package:hive/hive.dart';

import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<List<ProfileModel>> getAllUser(int page);
  Future<ProfileModel> getUser(int id);
}

class ProfileLocalDataSourceImplementation extends ProfileLocalDataSource {
  final HiveInterface hive;

  ProfileLocalDataSourceImplementation({required this.hive});

  @override
  Future<List<ProfileModel>> getAllUser(int page) async {
    var box = Hive.box("profile_box");
    return box.get("getAllUser");
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    var box = Hive.box("profile_box");
    return box.get("getUser");
  }
}
