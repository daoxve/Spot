import 'package:spot/core/utils/exports.dart';
import 'package:spot/core/utils/hive_boxes.dart';

class HiveStore {
  // Add Data to Hive Box
  static void addDataToHive(dynamic value) async {
    var box = await Hive.openBox(HiveBoxes.searchStorageBox);
    box.add(value);
    debugPrint('Add data: $value');
  }

  /// Update data in Hive Box
  static void updateDataInHive(String key, String value) async {
    var box = await Hive.openBox(HiveBoxes.searchStorageBox);
    box.put(key, value);
    debugPrint('Updated to $value in $key');
  }

  // Get Data from Hive Box
  static Future<dynamic> getDataFromHive(String key) async {
    var box = await Hive.openBox(HiveBoxes.searchStorageBox);
    return box.get(key);
  }

  // Delete Data from Hive Box
  static void deleteDataInHive(String key) async {
    var box = await Hive.openBox(HiveBoxes.searchStorageBox);
    box.delete(key);
  }

  static Future<void> deleteAll() async {
    var box = await Hive.openBox(HiveBoxes.searchStorageBox);
    await box.clear();
  }

  // @override
  // void dispose() {
  //   // Closes all Hive boxes
  //   Hive.close();
  //   super.dispose();
  // }
}
