import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthkit_plugin/healthkit_plugin.dart';
import 'package:yasta/src/bloc/healthkit/healthkit_event.dart';
import 'package:yasta/src/bloc/healthkit/healthkit_state.dart';

class HealthKitBloc extends Bloc<HealthKitEvent, HealthKitState> {
  final HealthkitPlugin healthkitPlugin;

  HealthKitBloc(this.healthkitPlugin) : super(HealthKitInitial()) {
    on<RequestAuthorization>(_requestAuthorization);
    on<QuerySteps>(_querySteps);
  }

  _requestAuthorization(
    RequestAuthorization event,
    Emitter<HealthKitState> emit,
  ) async {
    emit(HealthKitLoading());
    try {
      bool isHealthKitAvailable =
          await healthkitPlugin.isHealthKitAvailable() ?? false;

      if (!isHealthKitAvailable) {
        emit(HealthKitAuthorizationFailed("HealthKit is not available"));
        return;
      }

      bool isAuthorized = await healthkitPlugin.requestAuthorization() ?? false;

      if (isAuthorized) {
        emit(HealthKitAuthorized());
      } else {
        emit(HealthKitAuthorizationFailed("Authorization failed"));
      }
    } catch (e) {
      emit(
          HealthKitAuthorizationFailed("Authorization error: ${e.toString()}"));
    }
  }

  _querySteps(QuerySteps event, Emitter<HealthKitState> emit) async {
    emit(HealthKitLoading());
    try {
      final steps = await healthkitPlugin.querySteps(pastDays: event.days);
      emit(HealthKitQuerySuccess(steps));
    } catch (e) {
      emit(HealthKitQueryFailed(e.toString()));
    }
  }
}
