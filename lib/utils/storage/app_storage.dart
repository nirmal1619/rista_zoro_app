import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final GetStorage _storage = GetStorage();

  // Store data
  static Future<void> writeData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // Retrieve data
  static T? readData<T>(String key) {
    return _storage.read(key);
  }

  // Remove data
  static Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Check if a key exists
  static bool hasData(String key) {
    return _storage.hasData(key);
  }

  // Clear all stored data
  static Future<void> clearAllData() async {
    await _storage.erase();
  }
}
