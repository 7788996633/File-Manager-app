import 'dart:io';

class FileServices {
  Future<List<FileSystemEntity>> showFiles(String path) async {
    try {
      final directory = Directory(path);
      final files = directory.listSync();
      return files;
    } catch (e) {
      return [];
    }
  }

  Future<String> deleteFile(FileSystemEntity file) async {
    try {
      if (await file.exists()) {
        await file.delete();
        return 'success';
      } else {
        throw Exception('File does not exist');
      }
    } catch (e) {
      throw Exception('Error deleting file: $e');
    }
  }

  Future<void> createFile(String path, String fileName) async {
    try {
      final filePath = '$path$fileName';
      final file = File(filePath);
      await file.writeAsString('File created with Flutter');
      print('File created successfully: $filePath');
    } catch (e) {
      print('Error creating file: $e');
    }
  }

  Future<void> createDirectory(String path, String directoryName) async {
    try {
      final dirPath = '$path$directoryName';
      final directory = Directory(dirPath);
      await directory.create(recursive: true);
      print('Directory created successfully: $dirPath');
    } catch (e) {
      print('Error creating directory: $e');
    }
  }
}
