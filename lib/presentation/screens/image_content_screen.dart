import 'dart:io';

import 'package:flutter/material.dart';

class ImageContentScreen extends StatelessWidget {
  final File file;

  const ImageContentScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.path.characters.toString()),
      ),
      body: Center(
        child: Image.file(file),
      ),
    );
  }
}
