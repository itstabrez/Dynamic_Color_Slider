import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_using_bloc/slider/bloc/slider_bloc.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final SliderBloc sliderBloc = SliderBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Slider"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                BlocConsumer<SliderBloc, SliderState>(
                  bloc: sliderBloc,
                  buildWhen: (previous, current) =>
                      current is! SliderActionState,
                  listenWhen: (previous, current) =>
                      current is SliderActionState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    bool switchValue = state is SliderNotificationSwitchState
                        ? state.isSwitchOn
                        : true;
                    return Switch(
                      value: switchValue,
                      onChanged: (value) {
                        sliderBloc.add(
                          SliderNotificationSwitchEvent(isSwitchOn: value),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<SliderBloc, SliderState>(
              bloc: sliderBloc,
              buildWhen: (previous, current) => current is! SliderActionState,
              listenWhen: (previous, current) => current is SliderActionState,
              listener: (context, state) {},
              builder: (context, state) {
                double opacity = state is SliderSlidingValuesEventState
                    ? state.slider
                    : 0.5; // Default opacity
                return Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 0.5,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(opacity),
                    border: Border.all(color: Colors.black),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<SliderBloc, SliderState>(
              bloc: sliderBloc,
              buildWhen: (previous, current) => current is! SliderActionState,
              listenWhen: (previous, current) => current is SliderActionState,
              listener: (context, state) {},
              builder: (context, state) {
                double sliderValue = state is SliderSlidingValuesEventState
                    ? state.slider
                    : 0.5; // Default slider value
                return Slider(
                  value: sliderValue,
                  onChanged: (value) {
                    sliderBloc.add(SliderSlidingValuesEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
