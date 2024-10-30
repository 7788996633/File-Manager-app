import 'dart:io';

import 'package:basharhaidartest/data/cubits/show_files_cubit/show_files_cubit.dart';
import 'package:basharhaidartest/data/helper/permession.dart';
import 'package:basharhaidartest/data/services/files_services.dart';
import 'package:basharhaidartest/presentation/widgets/file_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FolderContentScreen extends StatefulWidget {
  const FolderContentScreen({super.key, required this.path});
  final String path;

  @override
  State<FolderContentScreen> createState() => _FolderContentScreenState();
}

class _FolderContentScreenState extends State<FolderContentScreen> {
  late List<FileSystemEntity> _files;
  void showAddOptionsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Add File'),
                onTap: () {
                  Navigator.pop(context);
                  showAddFileOrFolderSheet(context, 'file');
                },
              ),
              ListTile(
                title: const Text('Add Folder'),
                onTap: () {
                  Navigator.pop(context);
                  showAddFileOrFolderSheet(context, 'folder');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showAddFileOrFolderSheet(BuildContext context, String type) {
    final TextEditingController nameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Enter ${type == 'file' ? 'file' : 'folder'} name',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text.trim();
                  if (name.isNotEmpty) {
                    if (type == 'file') {
                    FileServices().  createFile(widget.path,name);
                    } else if (type == 'folder') {
                     FileServices().  createDirectory(widget.path,name);
                    }
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  void initState() {
    PermessionServices().checkPermissions();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFiles();
  }

  void _loadFiles() {
    BlocProvider.of<ShowFilesCubit>(context).showFiles(widget.path);
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ShowFilesCubit, ShowFilesState>(
      builder: (context, state) {
        if (state is ShowFilesSuccess) {
          _files = state.files;
          return _buildFileList();
        } else if (state is ShowFilesFail) {
          return Column(
            children: [
              const Text(
                "There is an error:",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                state.errmsg,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showAddOptionsSheet(context);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.light_mode),
          ),
        ],
        title: Text(
          widget.path,
        ),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget _buildFileList() {
    return ListView.builder(
      itemCount: _files.length,
      itemBuilder: (context, index) {
        return FileItem(
          file: _files[index],
          onFolderTap: () {
            _loadFiles();
          },
        );
      },
    );
  }
}
