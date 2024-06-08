import 'package:equatable/equatable.dart';

abstract class HealthKitEvent extends Equatable {
  const HealthKitEvent();

  @override
  List<Object> get props => [];
}

class RequestAuthorization extends HealthKitEvent {}

class QuerySteps extends HealthKitEvent {
  final int days;

  const QuerySteps(this.days);

  @override
  List<Object> get props => [days];
}
