import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:beach_combine/models/notification.dart' as noti;

class NoticeService {
  final url = '$baseUrl/members/notification';

  Future<List<noti.Notification>> getNotifications() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get(url,
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print(res);
      final notifications = noti.Notification.fromJsonList(res.data);
      return notifications;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
