import 'package:bloc/bloc.dart';
import 'package:search_and_filtering/model/response_model.dart';
import 'package:search_and_filtering/service/api/IService.dart';
import 'package:search_and_filtering/service/auth/IOAuthService.dart';

import '../TEST.dart';

class CubitController extends Cubit<ControllerState> {
  CubitController(this.authService, this.service) : super(InitState());

  //auth service
  final IOAuthService authService;
  //api service
  final IService service;

  bool isLoading = false;

  //objects table
  bool isListView = true;
  List<ResponseModel?> objectsTable = TEST.objects();

  //state codes
  String selectedStateCode = '-';
  List<String?> stateCodes = [];

  //states/provinces
  String selectedStateProvince = '-';
  List<String?> statesProvinces = [];

  Future<void> getAccessToken() async {
    changeLoadingView(true);
    final data = await authService.authenticate();
    changeLoadingView(false);
    if (data == null) {
      service.dio.options.headers = {
        'Authorization': 'Bearer $data',
        'Content-Type': 'application/json',
        'charset': 'utf-8'
      };
      emit(AuthSuccessful());
    } else {
      emit(AuthFail());
    }
  }

  Future<void> getAccounts({String params = ''}) async {
    final data = await service.getAccounts(params: params);
    if (data != null) {
      //load sample datas
      objectsTable = data;
      setStateCodes();
      setStatesProvinces();
      emit(DataReceived(data));
    } else {
      emit(DataReceiveFail());
    }
  }

  void changeLoadingView(bool b) {
    isLoading = b;
    emit(LoadingState(isLoading));
  }

  void changeTableView(bool b) {
    isListView = b;
    emit(TableView(b));
  }

  void updateObjectsTable(List<ResponseModel?> list) {
    objectsTable = list;
    emit(TableUpdated());
  }

  void setStateCodes() {
    stateCodes =
        TEST.objects().map((e) => e.statecode.toString()).toSet().toList();
    stateCodes.insert(0, '-');
  }

  void setStatesProvinces() {
    statesProvinces = TEST
        .objects()
        .map((e) => e.address1Stateorprovince.toString())
        .toSet()
        .toList();
    statesProvinces.insert(0, '-');
  }

  void changeStateCode(String s) {
    selectedStateCode = s;
  }

  void changeStateProvince(String s) {
    selectedStateProvince = s;
  }
}

abstract class ControllerState {}

class InitState extends ControllerState {}

class AuthSuccessful extends ControllerState {}

class AuthFail extends ControllerState {}

class DataReceived extends ControllerState {
  final List<ResponseModel?> accounts;

  DataReceived(this.accounts);
}

class DataReceiveFail extends ControllerState {}

class LoadingState extends ControllerState {
  final bool isLoading;

  LoadingState(this.isLoading);
}

class TableView extends ControllerState {
  final bool isListView;

  TableView(this.isListView);
}

class TableUpdated extends ControllerState {}
