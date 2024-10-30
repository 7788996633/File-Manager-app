import 'dart:io';

import 'package:flutter/material.dart';

class TextcontentScreen extends StatelessWidget {
  final File file;

  const TextcontentScreen({super.key, required this.file});

  Future<String> _readFile() async {
    return await file.readAsString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Viewer'),
      ),
      body: FutureBuilder<String>(
        future: _readFile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Text(snapshot.data ?? ''),
            );
          }
        },
      ),
    );
  }
}
