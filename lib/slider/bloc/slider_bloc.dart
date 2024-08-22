import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<SliderNotificationSwitchEvent>((event, emit) async {
      await sliderNotificationSwitchEvent(event, emit);
    });
    on<SliderSlidingValuesEvent>((event, emit) async {
      await sliderSlidingValuesEvent(event, emit);
    });
  }

  FutureOr<void> sliderNotificationSwitchEvent(
      SliderNotificationSwitchEvent event, Emitter<SliderState> emit) {
    emit(SliderNotificationSwitchState(isSwitchOn: event.isSwitchOn));
  }

  FutureOr<void> sliderSlidingValuesEvent(
      SliderSlidingValuesEvent event, Emitter<SliderState> emit) {
    emit(SliderSlidingValuesEventState(slider: event.slider));
  }
}
