import 'dart:io';

import 'package:basharhaidartest/data/cubits/delete_file_cubit/delete_file_cubit.dart';
import 'package:basharhaidartest/presentation/screens/image_content_screen.dart';
import 'package:basharhaidartest/presentation/screens/text_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/folder_content_screen.dart';

class FileItem extends StatefulWidget {
  const FileItem({super.key, required this.file, required this.onFolderTap});
  final FileSystemEntity file;
  final VoidCallback onFolderTap;

  @override
  State<FileItem> createState() => _FileItemState();
}

class _FileItemState extends State<FileItem> {
  void _showFileDetails(FileSystemEntity file) {
    if (file is File) {
      final fileExtension = file.path.split('.').last.toLowerCase();
      if (['jpg', 'jpeg', 'png', 'webp'].contains(fileExtension)) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageContentScreen(file: file),
          ),
        );
      } else if (['txt'].contains(fileExtension)) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TextcontentScreen(file: file),
          ),
        );
      } else {
        _showErrorDialog('Unsupported file type');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onItemTap() {
    if (widget.file is Directory) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FolderContentScreen(
            path: widget.file.path,
          ),
        ),
      ).then((_) {
        widget.onFolderTap();
      });
    } else {
      _showFileDetails(widget.file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: _onItemTap,
          title: Text(
            widget.file.path.split('/').last,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.file is File ? 'File' : 'Directory',
            style: const TextStyle(fontSize: 20),
          ),
          leading: Icon(
            widget.file is File ? Icons.insert_drive_file : Icons.folder,
            color: widget.file is File ? Colors.blue : Colors.orange,
          ),
          trailing: BlocConsumer<DeleteFileCubit, DeleteFileState>(
            listener: (context, state) {
              if (state is DeleteFileSuccess) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 202, 187, 231),
                    content: Text(
                      state.successmsg,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              } else if (state is DeleteFileFail) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 202, 187, 231),
                    content: Text(
                      state.errmsg,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed: ()  {
                    BlocProvider.of<DeleteFileCubit>(context).deleteFile(widget.file);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
