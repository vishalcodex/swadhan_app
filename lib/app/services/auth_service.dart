import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../models/user_model.dart';

// import '../models/user_model.dart';
// import '../repositories/user_repository.dart';
// import 'settings_service.dart';

class AuthService extends GetxService {
  late Rx<User> user = User().obs;
  // late UserRepository _userRepository;
  late GetStorage _box;
  late bool isRegistered = false;
  late bool showOnboarding = true;
  late bool toRegister = true;
  // late bool isCustomer = false;
  late String? token = "";

  AuthService() {
    _box = GetStorage();
  }

  Future<AuthService> init() async {
    token = await _box.read("token");
    // isCustomer = await _box.read("isCustomer") ?? true;
    showOnboarding = await _box.read('showOnboarding') ?? true;
    isRegistered = await _box.read('isRegistered') ?? false;
    await getCurrentUser();
    return this;
  }

  setOnBoarding(bool toRegister) async {
    showOnboarding = false;
    this.toRegister = toRegister;
    await _box.write('toRegister', toRegister);
    await _box.write('showOnboarding', false);
  }

  Future getCurrentUser() async {
    var u0 = await _box.read("current_user");
    user.value = u0 == null ? User() : User.fromJson(u0);
    // _userRepository = UserRepository();
    // && JwtDecoder.isExpired(token!)
    // if (token != null) {
    //   await _userRepository.fetchUserDetails().then((value) async {
    //     await _box.write('current_user', user.value.toJson());
    //   });
    // }
  }

  Future removeCurrentUser() async {
    user.value = User();
    // await _userRepository.signOut();
    token = "";
    await _box.remove('current_user');
    await _box.remove("token");
  }

  Future setIsCustomer(bool value) async {
    // isCustomer = value;
    // await _box.write("isCustomer", value);
  }

  Future saveUser(User value) async {
    OneSignal.User.addTagWithKey("isUser", "Yes");
    OneSignal.User.addAlias("user_id", value.id);
    // await OneSignal.User.getExternalId().then((id) {
    //   log("One Signal External Id: $id");
    OneSignal.login(value.id.toString());
    // });
    // await OneSignal.User.getExternalId();
    if ((value.token ?? "") != "") {
      await _box.write("token", value.token);
      user.value = value;
      token = value.token;
    }
    // await _userRepository.fetchUser();
    await _box.write('current_user', user.value.toJson());
  }

  // bool get isAuth => user.value.id != "";
  bool get isRegistering => isRegistered;

  // String get apiToken => (user.value.auth ?? false) ? user.value.apiToken : '';
}
