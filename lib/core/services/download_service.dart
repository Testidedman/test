import 'dart:io';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {

  static Future<void> init() async {
    await FlutterDownloader.initialize(
        debug: true,
        ignoreSsl: true
    );
  }

  static Future<void> download() async {
    final Directory? appDocumentsDir = await getDownloadsDirectory();
    await FlutterDownloader.enqueue(
      url: 'https://i.pinimg.com/originals/5d/e2/42/5de24294bad21ec99931f4c362354f22.jpg',
      headers: {}, // optional: header send with url (auth token etc)
      fileName: 'test.png',
      savedDir: appDocumentsDir!.absolute.path,
      showNotification: true,
      openFileFromNotification: true,
    );
  }
}