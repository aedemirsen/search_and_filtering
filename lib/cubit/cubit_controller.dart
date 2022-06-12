import 'package:bloc/bloc.dart';

class CubitController extends Cubit<ControllerState> {
  CubitController() : super(InitState());
}

abstract class ControllerState {}

class InitState extends ControllerState {}

class LoadingState extends ControllerState {}

class DataReceived extends ControllerState {}

class DataReceiveFail extends ControllerState {}
