import 'package:beach_combine/models/ranking.dart';
import 'package:beach_combine/services/ranking_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RankingController extends GetxController {
  final monthlyRanking = <Ranking>[].obs;
  final allTimeRanking = <Ranking>[].obs;
  final rankingService = RankingService();
  bool isFirst = true;
  int lastId = 0, lastPoint = 0, pageSize = 10;
  final nextPage = true.obs;

  @override
  onInit() {
    getMonthlyRanking();
    getAllRanking();
    isFirst = false;
    super.onInit();
  }

  getMonthlyRanking() async {
    final result = await rankingService.getMonthlyRanking(pageSize);
    if (result != null) {
      monthlyRanking.value = result;
    }
  }

  getAllRanking() async {
    print(lastId);
    print(lastPoint);
    final result = await rankingService.getAllRanking(
        lastId, lastPoint, pageSize, isFirst);
    if (result.isNotEmpty) {
      allTimeRanking.addAll(result);
      lastId = result.last.id;
      lastPoint = result.last.point;
      print(lastId);
      print(lastPoint);
    } else {
      nextPage.value = false;
    }
  }

  // getAllRanking() async {
  //   final result =
  //       await rankingService.getAllRanking(lastId, lastPoint, pageSize);
  //   return result;
  // }
}
