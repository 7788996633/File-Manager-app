import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'change_light_mode_state.dart';

class ChangeLightModeCubit extends Cubit<ChangeLightModeState> {
  ChangeLightModeCubit() : super(ChangeLightModeInitial());
  void changeLightMode(bool light) {
    if (light == true) {
      emit(
        ChangeLightModeLight(
            textColors: Colors.black,
            backGroundColors: Colors.white,
            dividerColors: Colors.black,
            iconsColors: Colors.black),
      );
    } else {
      emit(
        ChangeLightModeDark(
            textColors: Colors.white,
            backGroundColors: Colors.black,
            dividerColors: Colors.white,
            iconsColors: Colors.white),
      );
    }
  }
}
