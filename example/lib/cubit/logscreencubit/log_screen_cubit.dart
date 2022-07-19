import 'package:bloc/bloc.dart';
import 'package:zithara_analytics/models/track_screen_route.dart';
import 'package:zithara_analytics/services/zi_analytics_service.dart';
part 'log_screen_state.dart';

class LogScreenCubit extends Cubit<LogScreenInitial> {
  LogScreenCubit(LogScreenState introState) : super(LogScreenInitial());
  @override
  void emit(LogScreenInitial state) {
    emit(state);
    super.emit(state);
  }
}
