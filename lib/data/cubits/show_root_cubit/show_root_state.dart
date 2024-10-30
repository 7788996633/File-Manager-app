part of 'show_root_cubit.dart';

@immutable
sealed class ShowRootState {}

final class ShowRootInitial extends ShowRootState {}

final class ShowRootSuccess extends ShowRootState {
  final List<FileSystemEntity> files;

  ShowRootSuccess({required this.files});
}

final class ShowRootFail extends ShowRootState {
  final String errmsg;

  ShowRootFail({required this.errmsg});
}

final class ShowRootLoading extends ShowRootState {}
