import 'dart:io';

import 'package:basharhaidartest/data/services/files_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_files_state.dart';

class ShowFilesCubit extends Cubit<ShowFilesState> {
  ShowFilesCubit() : super(ShowFilesInitial());
  void showFiles(String path) {
    emit(
      ShowFilesLoading(),
    );
    try {
      FileServices().showFiles(path).then(
            (value) => emit(
              ShowFilesSuccess(
                files: value,
              ),
            ),
          );
    } on Exception catch (e) {
      emit(
        ShowFilesFail(
          errmsg: e.toString(),
        ),
      );
    }
  }
}
