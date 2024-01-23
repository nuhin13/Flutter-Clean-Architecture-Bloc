import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/core_export.dart';

getVersion() async {
  final BaseCache cache = serviceLocator<BaseCache>();
  if (await cache.has(SharedPreferenceConstant.version)) {
    var version = await cache.get(SharedPreferenceConstant.version);
    debugPrint("$version");
    return version;
  } else {
    final info = await PackageInfo.fromPlatform();
    cache.put(SharedPreferenceConstant.version, info.version,
        const Duration(hours: 24));
    return info.version;
  }
}
