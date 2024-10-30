part of 'change_light_mode_cubit.dart';

@immutable
sealed class ChangeLightModeState {}

final class ChangeLightModeInitial extends ChangeLightModeState {}

final class ChangeLightModeLight extends ChangeLightModeState {
  final Color textColors;
  final Color backGroundColors;
  final Color dividerColors;
  final Color iconsColors;

  ChangeLightModeLight(
      {required this.textColors,
      required this.backGroundColors,
      required this.dividerColors,
      required this.iconsColors});
}

final class ChangeLightModeDark extends ChangeLightModeState {
  final Color textColors;
  final Color backGroundColors;
  final Color dividerColors;
  final Color iconsColors;

  ChangeLightModeDark(
      {required this.textColors,
      required this.backGroundColors,
      required this.dividerColors,
      required this.iconsColors});
}
