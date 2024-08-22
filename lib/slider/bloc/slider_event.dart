part of 'slider_bloc.dart';

@immutable
abstract class SliderEvent {}

class SliderNotificationSwitchEvent extends SliderEvent {
  final bool isSwitchOn;

  SliderNotificationSwitchEvent({required this.isSwitchOn});
}

class SliderSlidingValuesEvent extends SliderEvent {
  final double slider;

  SliderSlidingValuesEvent({required this.slider});
}
