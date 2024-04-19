import 'package:application_with_firebase/presentation/image_viewer.dart';
import 'package:flutter/material.dart';

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageViewer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
