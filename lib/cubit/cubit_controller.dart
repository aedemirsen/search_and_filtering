import 'package:bloc/bloc.dart';
import 'package:search_and_filtering/service/api/IService.dart';
import 'package:search_and_filtering/service/auth/IOAuthService.dart';

class CubitController extends Cubit<ControllerState> {
  CubitController(this.authService, this.service) : super(InitState());

  //auth service
  final IOAuthService authService;
  //api service
  final IService service;

  bool isLoading = false;

  Future<void> getAccessToken() async {
    changeLoadingView(true);
    final data = await authService.loginAction();
    changeLoadingView(false);
    if (data is String) {
      emit(AuthSuccessful(data));
    } else {
      emit(AuthFail());
    }
  }

  Future<void> getAccountByName(String? accountName) async {
    final data = await service.getAccountByName(accountName);
  }

  Future<void> getAccountByNumber(String? accountNumber) async {
    final data = await service.getAccountByNumber(accountNumber);
  }

  void changeLoadingView(bool b) {
    isLoading = b;
    emit(LoadingState(isLoading));
  }
}

abstract class ControllerState {}

class InitState extends ControllerState {}

class AuthSuccessful extends ControllerState {
  final String accessToken;

  AuthSuccessful(this.accessToken);
}

class AuthFail extends ControllerState {}

class DataReceived extends ControllerState {}

class DataReceiveFail extends ControllerState {}

class LoadingState extends ControllerState {
  final bool isLoading;

  LoadingState(this.isLoading);
}
