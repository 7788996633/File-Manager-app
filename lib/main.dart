import 'package:basharhaidartest/data/cubits/change_light_mode_cubit/change_light_mode_cubit.dart';
import 'package:basharhaidartest/data/cubits/delete_file_cubit/delete_file_cubit.dart';
import 'package:basharhaidartest/data/cubits/show_files_cubit/show_files_cubit.dart';
import 'package:basharhaidartest/presentation/screens/folder_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowFilesCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeLightModeCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFileCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FolderContentScreen(path: '/storage/emulated/0/'),
    );
  }
}
