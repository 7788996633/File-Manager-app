import 'dart:io';

import 'package:basharhaidartest/data/services/files_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_file_state.dart';

class DeleteFileCubit extends Cubit<DeleteFileState> {
  DeleteFileCubit() : super(DeleteFileInitial());
  void deleteFile(FileSystemEntity file) {
    emit(
      DeleteFileLoadin(),
    );
    try {
      FileServices().deleteFile(file).then(
            (value) => emit(
              DeleteFileSuccess(
                successmsg: value,
              ),
            ),
          );
    } on Exception catch (e) {
      emit(
        DeleteFileFail(
          errmsg: e.toString(),
        ),
      );
    }
  }
}
