import 'package:dio/dio.dart';
import 'package:search_and_filtering/model/response_model.dart';

abstract class IService {
  final Dio dio;

  IService(this.dio);

  Future<List<ResponseModel?>> getAccounts();
  Future<ResponseModel?> getAccountByName(String? accountName);
  Future<ResponseModel?> getAccountByNumber(String? accountNumber);
}
