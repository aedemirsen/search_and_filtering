import 'package:search_and_filtering/model/response_model.dart';
import 'package:search_and_filtering/service/api/IService.dart';

class Service extends IService {
  Service(super.dio);

  @override
  Future<ResponseModel?> getAccountByName(String? accountName) {
    // TODO: implement getAccountByName
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel?> getAccountByNumber(String? accountNumber) {
    // TODO: implement getAccountByNumber
    throw UnimplementedError();
  }

  @override
  Future<List<ResponseModel?>> getAccounts() {
    // TODO: implement getAccounts
    throw UnimplementedError();
  }
}
