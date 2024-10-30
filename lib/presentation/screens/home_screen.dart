// import 'package:basharhaidartest/data/cubits/show_root_cubit/show_root_cubit.dart';
// import 'package:basharhaidartest/presentation/widgets/file_item.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class FileManager extends StatefulWidget {
//   const FileManager({super.key});

//   @override
//   FileManagerState createState() => FileManagerState();
// }

// class FileManagerState extends State<FileManager> {
//   late List<FileSystemEntity> _files ;

//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ShowRootCubit>(context).showFiles();
//   }

//   Widget buildBlocWidget() {
//     return BlocBuilder<ShowRootCubit, ShowRootState>(
//       builder: (context, state) {
//         if (state is ShowRootSuccess) {
//           _files = state.files;
//           return _buildFileList();
//         } else if (state is ShowRootFail) {
//           return Column(
//             children: [
//               const Text(
//                 "There is an error:",
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 state.errmsg,
//                 style: const TextStyle(
//                     fontSize: 30,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.add,
//             ),
//           ),
//           const Icon(
//             Icons.search,
//           ),
//         ],
//         title: const Text('File Manager'),
//       ),
//       body: buildBlocWidget(),
//     );
//   }

//   Widget _buildFileList() {
//     return ListView.builder(
//       itemCount: _files.length,
//       itemBuilder: (context, index) {
//         return FileItem(onFolderTap:   () {
//               BlocProvider.of<ShowRootCubit>(context).showFiles();

//         },
  

//           file: _files[index],
//         );
//       },
//     );
//   }
// }
