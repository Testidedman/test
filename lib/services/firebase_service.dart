import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_app/firebase_options.dart';

///Сервис для работы с продуктами firebase
class FirebaseService {

  ///Инициализация
  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    catch (_) {
      rethrow;
    }
  }

  static Future<void> initPushNotification() async {
    final notificationSettings = await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    print(fcmToken);

    // final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    // if (apnsToken != null) {}
  }
}