import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationManager {
  static void showNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'meal_notification',
        title: 'Hello Foodie',
        body: 'Thank you for sharing food with me',
        payload: {'uuid': 'user-profile-uuid'},
      ),
    );
  }
}
