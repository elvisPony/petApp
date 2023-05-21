import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> intialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@drawable/ic_stat_alarm');


    IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );
    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS:  iosInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async{
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true
    );
    const IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotificationWithPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async{
    final details = await _notificationDetails();
    await _localNotificationService.show(id,title,body, details, payload: payload);
  }

  Future<void> showScheduleNotification(
      {required int id,
        required String title,
        required String body,
        required int days,
        required int hours,
        required int minutes,
        required int seconds
    }) async{
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(DateTime.now().add(Duration(days: days, hours: hours, minutes: minutes,seconds: seconds)), tz.local,),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        );
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload
      ){
    print('id $id');
  }
  void onSelectNotification(String? payload){
    print('payload $payload');
    if (payload != null && payload.isNotEmpty){
      onNotificationClick.add(payload);
    }
  }

}
