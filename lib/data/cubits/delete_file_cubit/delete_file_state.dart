part of 'delete_file_cubit.dart';

@immutable
sealed class DeleteFileState {}

final class DeleteFileInitial extends DeleteFileState {}

final class DeleteFileSuccess extends DeleteFileState {
  final String successmsg;

  DeleteFileSuccess({required this.successmsg});
}

final class DeleteFileFail extends DeleteFileState {
  final String errmsg;

  DeleteFileFail({required this.errmsg});
}

final class DeleteFileLoadin extends DeleteFileState {}
