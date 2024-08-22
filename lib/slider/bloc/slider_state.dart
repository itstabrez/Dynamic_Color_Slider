part of 'slider_bloc.dart';

@immutable
abstract class SliderState {}

abstract class SliderActionState extends SliderState {}

class SliderInitial extends SliderState {}

class SliderNotificationSwitchState extends SliderState {
  final bool isSwitchOn;

  SliderNotificationSwitchState({required this.isSwitchOn});
}

class SliderSlidingValuesEventState extends SliderState {
  final double slider;

  SliderSlidingValuesEventState({required this.slider});
}
