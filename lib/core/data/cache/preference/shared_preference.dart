import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class SharedPreference {
  static var errorSharedPref = "Error From SharedPreference => ";

  static Future<String?> getValue(String key) async {
    const storage = FlutterSecureStorage();
    String? value = '';
    try {
      value = await storage.read(key: key);
    } catch (e) {
      Logger().e(errorSharedPref + e.toString());
    }
    return value;
  }

  static Future<bool> setValue(String key, String value) async {
    const storage = FlutterSecureStorage();
    bool saved = false;

    try {
      storage.write(key: key, value: value);
      saved = true;
    } catch (e) {
      Logger().e(errorSharedPref + e.toString());
    }

    return saved;
  }

  static Future<void> remove(String key) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: key);
  }

  static Future<void> removeMultiple(RegExp pattern) async {
    const storage = FlutterSecureStorage();
    final all = await storage.readAll();

    for (var key in all.keys) {
      if (!pattern.hasMatch(key)) continue;
      await storage.delete(key: key);
    }
  }

  static Future<bool> setBool(String key, bool value) async {
    const storage = FlutterSecureStorage();
    bool saved = false;
    try {
      storage.write(key: key, value: value.toString());
      saved = true;
    } catch (e) {
      Logger().e(errorSharedPref + e.toString());
    }
    return Future<bool>.value(saved);
  }

  static Future<bool> getBool(String key) async {
    bool hasValue = false;
    try {
      final String? value = await SharedPreference.getValue(key);
      hasValue = value.toString().toLowerCase() == "true" ? true : false;
    } catch (e) {
      Logger().e(errorSharedPref + e.toString());
    }
    return Future<bool>.value(hasValue);
  }

  static Future<void> removeAll() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
