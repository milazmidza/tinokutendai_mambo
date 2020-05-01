import 'package:flutter/services.dart';

Future<String> loadAsset(String fileName) async {
  print("hey $fileName");
  return await rootBundle.loadString('assets/files/$fileName.txt');
}