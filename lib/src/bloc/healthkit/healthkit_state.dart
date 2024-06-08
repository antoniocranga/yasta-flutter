import 'package:equatable/equatable.dart';

abstract class HealthKitState extends Equatable {
  const HealthKitState();

  @override
  List<Object> get props => [];
}

class HealthKitInitial extends HealthKitState {}

class HealthKitLoading extends HealthKitState {}

class HealthKitAuthorized extends HealthKitState {}

class HealthKitAuthorizationFailed extends HealthKitState {
  final String message;

  const HealthKitAuthorizationFailed(this.message);

  @override
  List<Object> get props => [message];
}

class HealthKitQuerySuccess extends HealthKitState {
  final List<Object?> steps;

  const HealthKitQuerySuccess(this.steps);

  @override
  List<Object> get props => [steps];
}

class HealthKitQueryFailed extends HealthKitState {
  final String message;

  const HealthKitQueryFailed(this.message);

  @override
  List<Object> get props => [message];
}
