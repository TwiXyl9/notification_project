import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notification_project/config/routes_names.dart';

import '../locator.dart';
import 'navigation_service.dart';

class NotificationService {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelGroupKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for tests',
              importance: NotificationImportance.Max,
              channelShowBadge: true,
              playSound: true,
              criticalAlerts: true,
              onlyAlertOnce: true,
              defaultColor: const Color(0xFF9D58D0),
              ledColor: Colors.white)
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'group_1')
        ],
        debug: true);
    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod);
  }

  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ?? {};
    if (payload['navigate'] == 'true') {
      locator<NavigationService>().navigateToWithParams(notificationRoute, {'title': payload['title']!, 'body': payload['body']!});
    }
  }

  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  static Future<void> show({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? interval,
  }) async {
    assert(!scheduled || (scheduled && interval != null));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 0,
          channelKey: 'basic_channel',
          title: title,
          body: body,
          actionType: actionType,
          notificationLayout: notificationLayout,
          summary: summary,
          category: category,
          payload: payload,
          bigPicture: bigPicture,
        ),
        actionButtons: actionButtons,
        schedule: scheduled
            ? NotificationInterval(
            interval: interval,
            timeZone:
            await AwesomeNotifications().getLocalTimeZoneIdentifier(),
            preciseAlarm: true)
            : null
    );
  }
}
