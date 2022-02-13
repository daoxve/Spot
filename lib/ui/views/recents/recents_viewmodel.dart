import 'package:spot/core/utils/exports.dart';

class RecentsViewModel extends BaseViewModel {
  late final Box box;

  final NavigationService _navigationService = locator<NavigationService>();

  Future<dynamic> initHiveBox() async {
    box = Hive.box(HiveBoxes.searchStorageBox);
    return box;
  }

  void insertAtIndex(int index) {
    HiveUtil.insertAtIndex(index);
  }

  void deleteAll() {
    HiveUtil.deleteAllData();
  }

  void navigateBack() {
    _navigationService.back();
  }

  void navigateTo(route) {
    _navigationService.navigateTo(route);
  }
}
