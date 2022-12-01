import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


import '../flutter_flow/flutter_flow_theme.dart';


String uri = 'http://139.144.69.227:3001';
//String uri = 'http://10.0.2.2:3000';
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.black,
    ),
  );
}

topBar(context, title, message){
  AnimatedSnackBar.rectangle(
    title,
    message,
    type: AnimatedSnackBarType.success,
    brightness: Brightness.light,

  ).show(
    context,
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
