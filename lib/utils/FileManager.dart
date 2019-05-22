import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class FileManager {
  static FileManager _fileManager;
  factory FileManager() {
    if (_fileManager == null) {
      _fileManager = FileManager._();
    }
    return _fileManager;
  }
  FileManager._();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> getLocalFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<File> getAssetsFile(String fullPath) async {
    return File(fullPath);
  }

  Future<Map<String, dynamic>> readJson(String jsonFile) async {
    try {
      final file = await getLocalFile(jsonFile);
      String contents = await file.readAsString();
      return jsonDecode(contents);
    } catch (e) {
      return null;
    }
  }

  Future<File> writeJson(Map<String, dynamic> map, String filename) async {
    final file = await getLocalFile(filename);

    final jsonStr = jsonEncode(map);

    return file.writeAsString(jsonStr);
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
