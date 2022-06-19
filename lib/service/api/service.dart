import 'package:search_and_filtering/model/response_model.dart';
import 'package:search_and_filtering/service/api/IService.dart';

class Service extends IService {
  Service(super.dio);

  @override
  Future<List<ResponseModel?>?> getAccounts({String? params = ''}) async {
    try {
      final response = await dio.get('$endpoint$params');
      return (response.data['value'] as List)
          .map((e) => ResponseModel.fromJson(e))
          .toList();
    } on Exception {
      return null;
    }
  }
}
