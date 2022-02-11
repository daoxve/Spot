import 'package:spot/core/utils/exports.dart';

class RecentsViewModel extends BaseViewModel {
  late final Box box;

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
}
