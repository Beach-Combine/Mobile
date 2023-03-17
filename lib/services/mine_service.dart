import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/giftcard.dart';
import 'package:beach_combine/models/member.dart';
import 'package:beach_combine/models/purchase.dart';
import 'package:beach_combine/widgets/gift_card.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MineService {
  final url = baseUrl;

  Future<Member?> getMember() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());

      final res = await dio.get('$url/members',
          options: Options(headers: {"accessToken": "true"}));
      print(res);
      final member = Member.fromJson(res.data);
      return member;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Giftcard>> getGiftcards() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/giftcards',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));

      print('[GET] [스토어 목록 요청] : ${res.data}');
      final giftCards = Giftcard.fromJsonList(res.data);
      return giftCards;
    } catch (e) {
      return [];
    }
  }

  Future<int> getPoint() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/members/point',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print('[GET] [잔여 포인트 조회] ${res.data}');
      final point = res.data['point'];
      return point;
    } catch (e) {
      return 0;
    }
  }

  Future<List<Purchase>> getPurchase() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/giftcards/purchase',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print('[GET] [구매목록조회] ${res.data}');
      final purchaseList = Purchase.fromJsonList(res.data);
      return purchaseList;
    } catch (e) {
      return [];
    }
  }

  Future<bool> purchaseGiftcard(int id) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.post('$url/giftcards/$id/purchase',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print('[POST] [구매요청] ${res.data}');
      return true;
    } catch (e) {
      return F;
    }
  }
}
