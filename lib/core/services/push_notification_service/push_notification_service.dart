import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/push_notification_service/ipush_notification_service.dart';

@Injectable(as: IPushNotificationService)
class PushNotificationService implements IPushNotificationService {

  @override
  Future<void> init() async {
    await initPushNotification();
  }

  @override
  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showNotification(message.notification!.title!, message.notification!.body!);
      }
    });
    print(fcmToken);

    // final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    // if (apnsToken != null) {}
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    print(payload);
  }

  static Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'my channel id',
        'my channel name',
        channelDescription: 'my channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker'
    );
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await FlutterLocalNotificationsPlugin().show(
        0,
        title,
        body,
        notificationDetails,
        payload: 'item x'
    );
  }
}