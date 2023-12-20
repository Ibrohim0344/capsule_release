import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart';



abstract interface class INotificationRepository {
  Future<void> postNotification({
    required String message,
    required String token,
    required String name,
  });
}

class NotificationRepository implements INotificationRepository {
  @override
  Future<void> postNotification({
   required String message,
   required String token,
   required String name,
  }) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization":
      "Bearer AAAA8LppoJU:APA91bHD-wl7n8INUo4nkcOIo0rhk59TG86dCw__Pw5bTx-VHcaAvsMFvdJmOR_TTPCfgL8g_wv39eqTWElrRRvBydm2NF6BDqI-54ghNbkRz8sUoVfWefZf5Zg187TU59ujDlb9nzGR"    };
    Map<String, Object?> body = {
      "notification": {"title": name, "body": message},
      "registration_ids": [
        token,
      ],
      "click_action": "FLUTTER_NOTIFICATION_CLICK"
    };
    final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');
    try {
      Response response =
      await post(uri, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
      } else {
        throw Error();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
