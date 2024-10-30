part of 'show_files_cubit.dart';

@immutable
sealed class ShowFilesState {}

final class ShowFilesInitial extends ShowFilesState {}

final class ShowFilesSuccess extends ShowFilesState {
  final List<FileSystemEntity> files;

  ShowFilesSuccess({required this.files});
}

final class ShowFilesFail extends ShowFilesState {
  final String errmsg;

  ShowFilesFail({required this.errmsg});
}

final class ShowFilesLoading extends ShowFilesState {}
