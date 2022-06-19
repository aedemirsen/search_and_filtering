import 'package:dio/dio.dart';
import 'package:search_and_filtering/model/response_model.dart';

abstract class IService {
  final Dio dio;

  final String endpoint = '/accounts';

  IService(this.dio);

  Future<List<ResponseModel?>?> getAccounts({String params = ''});
}
