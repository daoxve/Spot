import 'package:spot/core/utils/exports.dart';
import 'package:spot/core/utils/hive_boxes.dart';

class RecentsViewModel extends BaseViewModel {
  late final Box box;
  List<String> recentSearches = [];

  Future<dynamic> initHiveBox() async {
    box = Hive.box(HiveBoxes.searchStorageBox);
    return box;
  }

  void deleteAllItems() {
    box.deleteFromDisk();
  }

  deleteFromIndex(int index) {
    box.deleteAt(index);
  }
}
