import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/data_user_reqres_model.dart';

abstract class DataUserReqresRemoteDataSource {
  Future<DataUserReqresModel> getDataUserReqresRandom();
  Future<DataUserReqresModel> getDataUserReqresById(int id);
}

class DataUserReqresRemoteDataSourceImpl extends DataUserReqresRemoteDataSource {
  @override
  Future<DataUserReqresModel> getDataUserReqresById(int id) async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users/$id"));

      if (response.statusCode != 200) return Future.error(ServerException(message: "Cannot get data [${response.statusCode}]"));

      Map<String, dynamic> data = jsonDecode(response.body)["data"];
      return DataUserReqresModel.fromJson(data);
    } catch (e) {
      return Future.error(const GeneralException(message: "Cannot get data user by id"));
    }
  }

  @override
  Future<DataUserReqresModel> getDataUserReqresRandom() async {
    try {
      int randomId = 1 + Random().nextInt(10);
      var response = await http.get(Uri.parse("https://reqres.in/api/users/$randomId"));

      if (response.statusCode != 200) return Future.error(ServerException(message: "Cannot get data [${response.statusCode}]"));

      Map<String, dynamic> data = jsonDecode(response.body)["data"];
      return DataUserReqresModel.fromJson(data);
    } catch (e) {
      return Future.error(const GeneralException(message: "Cannot get data user random"));
    }
  }
}
