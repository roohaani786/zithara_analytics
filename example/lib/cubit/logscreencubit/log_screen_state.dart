part of 'log_screen_cubit.dart';

abstract class LogScreenState {}

class LogScreenInitial extends LogScreenState {

  TrackScreenRouteModel _data = TrackScreenRouteModel(status: 200);

  TrackScreenRouteModel get data => _data;

  set data(TrackScreenRouteModel value) {
    _data = value;
  }
}
