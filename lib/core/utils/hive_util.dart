import 'package:spot/core/utils/exports.dart';

class HiveUtil {
  // Adds Data to Hive Box
  static void addData(dynamic value) async {
    var box = await Hive.openBox(HiveBoxes.searchBox);
    box.add(value);
  }

  /// Updates data in Hive Box
  static void updateData(String key, String value) async {
    var box = await Hive.openBox(HiveBoxes.searchBox);
    box.put(key, value);
  }

  // Get Data from Hive Box
  static Future<dynamic> getData(String key) async {
    var box = await Hive.openBox(HiveBoxes.searchBox);
    return box.get(key);
  }

  // Delete Data from Hive Box
  static void deleteData(String key) async {
    var box = await Hive.openBox(HiveBoxes.searchBox);
    box.delete(key);
  }

  static Future<void> deleteAllData() async {
    var box = await Hive.openBox(HiveBoxes.searchBox);
    await box.clear();
  }

  static void deleteAtIndex(int index) async {
    var box = await Hive.openBox(HiveBoxes.searchBox);
    await box.deleteAt(index);
  }

  static void insertAtIndex(int index) async{
    var box = await Hive.openBox(HiveBoxes.searchBox);
    await box.getAt(index);
  }
}
