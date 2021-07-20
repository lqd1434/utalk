import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyLocalNotifications {
  /// 单例对象
  static FlutterLocalNotificationsPlugin? _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  MyLocalNotifications() {
    _instance = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _instance!.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  Future onDidReceiveLocalNotification(
      int i, String? payload, String? payloa3, String? payload2) async {
    print('onDidReceiveLocalNotification');
  }

  Future onSelectNotification(String? payload) async {
    print('onSelectNotification');
    if (payload != null) {
      print('kkk');
    }
  }

  void show() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    MyLocalNotifications._instance?.show(0, 'hello', 'body', platformChannelSpecifics);
  }
}
