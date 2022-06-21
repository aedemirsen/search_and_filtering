import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_and_filtering/core/model/response_model.dart';
import 'package:search_and_filtering/core/service/api/IService.dart';
import 'package:search_and_filtering/core/service/api/service.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

void main() {
  IService service = Service(Dio(BaseOptions(baseUrl: conf.baseUrl)));

  //get all accounts
  test('get accounts', () async {
    final data = await service.getAccounts();
    expect(data is List<ResponseModel>, true);
  });

  //get account by name
  test('get accounts by name', () async {
    const params = '?\$filter=name eq \'A. Datum\'';
    final data = await service.getAccounts(params: params);
    expect(data is List<ResponseModel>, true);
  });

  //get account by number
  test('get accounts by account number', () async {
    const params = '?\$filter=accountnumber eq \'AF3HN2S4\'';
    final data = await service.getAccounts(params: params);
    expect(data is List<ResponseModel>, true);
  });
}
