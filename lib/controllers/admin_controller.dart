import 'package:beach_combine/models/certification_requests.dart';
import 'package:beach_combine/services/admin_service.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  final certificationRequests = <CertificationRequests>[].obs;

  final AdminService adminService = AdminService();

  @override
  onInit() {
    super.onInit();
    getCertificationRequests();
  }

  Future<void> getCertificationRequests() async {
    final result = await adminService.getCertificationRequests();
    certificationRequests.value = result;
    print(certificationRequests.length);
  }
}
