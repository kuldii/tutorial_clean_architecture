import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/profile_model.dart';

// REAL CLASS
abstract class ProfileRemoteDataSource {
  Future<List<ProfileModel>> getAllUser(int page);
  Future<ProfileModel> getUser(int id);
}

class ProfileRemoteDataSourceImplementation extends ProfileRemoteDataSource {
  final http.Client client;

  // REAL CLASS / FAKE CLASS
  ProfileRemoteDataSourceImplementation({required this.client});

  @override
  Future<List<ProfileModel>> getAllUser(int page) async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=$page");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      List<dynamic> data = dataBody["data"];
      if (data.isEmpty) throw const EmptyException(message: "Error Empty Data");
      return ProfileModel.fromJsonList(data);
    } else if (response.statusCode == 404) {
      throw const StatusCodeException(message: "Data not found - Error 404");
    } else {
      throw const GeneralException(message: "Cannot get data");
    }
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dataBody = jsonDecode(response.body);
      Map<String, dynamic> data = dataBody["data"];
      return ProfileModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw const EmptyException(message: "Data not found - Error 404");
    } else {
      throw const GeneralException(message: "Cannot get data");
    }
  }
}
