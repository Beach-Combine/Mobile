import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/giftcard.dart';
import 'package:beach_combine/models/marker_record.dart';
import 'package:beach_combine/models/member.dart';
import 'package:beach_combine/models/my_record/my_record.dart';
import 'package:beach_combine/models/purchase.dart';
import 'package:beach_combine/models/record.dart';
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

  Future<List<MarkerRecord>> getMarkerRecords() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('${url}/records/map',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print('[GET] [해변 청소기록 마커 조회] ${res.data}');
      final markerRecords = MarkerRecord.fromJsonList(res.data);
      return markerRecords;
    } catch (e) {
      return [];
    }
  }

  Future<MyRecord?> getRecords(int id) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/records/$id/member',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print(['[GET] [해변별 청소기록 가져오기] ${res.data}']);
      final records = MyRecord.fromJson(res.data);
      return records;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Record>> getGridRecord() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/records',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      final records = Record.fromJsonList(res.data);
      return records;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> editAccount(String nickname) async {
    try {
      print(nickname);
      final formData = FormData.fromMap(
          {'nickname': nickname, 'image': null, 'isChanged': false});
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = dio.patch('$url/members',
          options: Options(headers: {
            'Content-type': 'multipart/form-data',
            'accessToken': 'true'
          }),
          data: formData);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> toggleProfilePublic(bool option) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.patch('$url/members/profile-public/$option',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      return true;
    } catch (e) {
      return false;
    }
  }
}
