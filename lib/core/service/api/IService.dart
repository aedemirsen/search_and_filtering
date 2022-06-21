import 'package:dio/dio.dart';

import '../../model/response_model.dart';

abstract class IService {
  final Dio dio;

  //final String endpoint = '/accounts';
  final String endpoint = '/accounts.json';

  IService(this.dio);

  Future<List<ResponseModel>?> getAccounts({String params = ''});
}
