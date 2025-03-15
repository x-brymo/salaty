part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  final double latitude;
  final double longitude;
  final LocalFailure? failure;

  const LocationState(
    this.latitude,
    this.longitude, {
    this.failure,
  });
}

class LocationInitial extends LocationState {
  const LocationInitial(super.latitude, super.longitude, LocalFailure failure)
      : super(failure: failure);

  @override
  List<Object> get props => [latitude, longitude];
}

class LocationLoading extends LocationState {
  const LocationLoading(super.latitude, super.longitude);

  @override
  List<Object> get props => [latitude, longitude];
}

class LocationSuccess extends LocationState {
  const LocationSuccess(super.latitude, super.longitude);

  @override
  List<Object> get props => [latitude, longitude];
}

class LocationFailed extends LocationState {
  const LocationFailed(super.latitude, super.longitude, LocalFailure failure)
      : super(failure: failure);

  @override
  List<Object> get props => [latitude, longitude];
}
