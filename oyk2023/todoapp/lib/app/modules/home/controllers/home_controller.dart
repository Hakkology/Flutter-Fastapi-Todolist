import 'package:get/get.dart';
import 'package:todoapp/app/data/models/user_model.dart';
import 'package:todoapp/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  final userProvider = Get.find<UserProvider>();
  List<User>? users;
  final isReady = false.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    users = await getUserList();
    print("oninit happened");
    super.onInit();
  }

  @override
  void onReady() async {
    await getCount();
    isReady.value = true;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<int> getCount() async {
    await Future.delayed(const Duration(seconds: 2));
    return 10;
  }

  Future<List<User>?> getUserList() async {
    await userProvider.getUsers();
  }
}
