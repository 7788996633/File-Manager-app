import 'dart:io';

import 'package:basharhaidartest/data/services/files_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_root_state.dart';

class ShowRootCubit extends Cubit<ShowRootState> {
  ShowRootCubit() : super(ShowRootInitial());

  void showFiles() {
    emit(
      ShowRootLoading(),
    );
    try {
      FileServices().showFiles('/storage/emulated/0/').then(
            (value) => emit(
              ShowRootSuccess(
                files: value,
              ),
            ),
          );
    } on Exception catch (e) {
      emit(
        ShowRootFail(
          errmsg: e.toString(),
        ),
      );
    }
  }
}
