import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_and_filtering/core/model/response_model.dart';
import 'package:search_and_filtering/core/service/api/IService.dart';
import 'package:search_and_filtering/core/service/api/service.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

IService service = Service(Dio(BaseOptions(baseUrl: conf.baseUrl)));
List<String> stateCodes = [];
List<String> statesProvinces = [];
void main() {
  final r1 = ResponseModel(
    statecode: 1,
    address1Stateorprovince: 'a',
  );
  final r2 = ResponseModel(
    statecode: 2,
    address1Stateorprovince: 'b',
  );
  final r3 = ResponseModel(
    statecode: 2,
    address1Stateorprovince: 'a',
  );
  test('filter params ok - statecode', () {
    stateCodes =
        [r1, r2, r3].map((e) => e.statecode.toString()).toSet().toList();
    stateCodes.insert(0, '-');
    expect(stateCodes.isNotEmpty, true);
  });

  test('filter params ok - statesProvinces', () {
    statesProvinces = [r1, r2, r3]
        .map((e) => e.address1Stateorprovince.toString())
        .toSet()
        .toList();
    statesProvinces.insert(0, '-');
    expect(statesProvinces.isNotEmpty, true);
  });
}
