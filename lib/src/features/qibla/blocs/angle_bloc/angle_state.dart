part of 'angle_bloc.dart';

abstract class AngleState extends Equatable {
  final double angle;
  final double radian;

  const AngleState(this.angle, this.radian);

  @override
  List<Object> get props => [angle, radian];
}

class AngleInitial extends AngleState {
  const AngleInitial(super.angle, super.radian);
}

class AngleLoaded extends AngleState {
  final double qiblaDirection;
  const AngleLoaded({
    required this.qiblaDirection,
    required double angle,
    required double radian,
  }) : super(angle, radian);
}

class AngleFailed extends AngleState {
  const AngleFailed(super.angle, super.radian);
}
