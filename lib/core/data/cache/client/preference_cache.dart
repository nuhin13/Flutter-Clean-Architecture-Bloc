import 'package:logger/logger.dart';

import 'base_cache.dart';
import '../preference/shared_preference.dart';

class PreferenceCache extends BaseCache {
  static const String _lastCachedAtKey = "cache_control:last_cached_at";

  @override
  Future<String?> get(String key) async {
    if (await doesNotHave(key)) return null;

    if (await isExpired(key)) {
      remove(key);
      return null;
    }
    var data = await SharedPreference.getValue("$key:data");

    Logger().i("From Cache for the key: $key => $data");
    return data;
  }

  @override
  Future<void> put(String key, String value, Duration duration) async {
    SharedPreference.setValue("$key:data", value);
    SharedPreference.setValue("$key:expires_at",
        DateTime.now().add(duration).millisecondsSinceEpoch.toString());
    await _setLastCachedAt();
  }

  @override
  Future<void> forever(String key, String value) async {
    await SharedPreference.setValue("$key:data", value);
    await _setLastCachedAt();
  }

  @override
  Future<bool> has(String key) async {
    if (await isExpired(key)) {
      remove(key);
      return false;
    }

    var value = await SharedPreference.getValue("$key:data");
    return value != null;
  }

  @override
  Future<bool> isExpired(String key) async {
    var expiresAt = await SharedPreference.getValue("$key:expires_at");
    if (expiresAt == null) return false;
    return int.parse(expiresAt) < DateTime.now().millisecondsSinceEpoch;
  }

  @override
  Future<void> remove(String key) async {
    await SharedPreference.remove("$key:data");
    await SharedPreference.remove("$key:expires_at");
  }

  @override
  Future<void> removeMultiple(RegExp keyPattern) async {
    await SharedPreference.removeMultiple(keyPattern);
  }

  @override
  Future<void> flushAll() async {
    await SharedPreference.removeAll();
  }

  Future<void> _setLastCachedAt() async {
    await SharedPreference.setValue(
        _lastCachedAtKey, DateTime.now().toString());
  }

  @override
  Future<DateTime?> lastCachedAt() async {
    var value = await SharedPreference.getValue(_lastCachedAtKey);
    if (value == null) return null;
    return DateTime.parse(value);
  }
}
