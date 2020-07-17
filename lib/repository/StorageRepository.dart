import 'dart:html';

import 'package:chatzie/providers/StorageProvider.dart';

class StorageRepository {
  StorageProvider storageProvider = StorageProvider();
  Future<String> uploadImage(File file, String path) =>
      storageProvider.uploadImage(file, path);
}
