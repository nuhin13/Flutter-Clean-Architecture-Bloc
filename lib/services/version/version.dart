/*
import 'package:flutter/material.dart';
import 'package:influencer_app/core/data/cache/base_cache.dart';
import 'package:influencer_app/core/data/cache/preference/shared_preference_constants.dart';
import 'package:influencer_app/core/domain/service_locator.dart';
import 'package:package_info_plus/package_info_plus.dart';

// abstract class GetVersion {
//   Future<String?> getVersion();
// }
//
// class GetVersionImpl extends GetVersion{
//   @override
//   Future<String?> getVersion() async {
//     final BaseCache cache = serviceLocator<BaseCache>();
//     if(await cache.has(SharedPreferenceConstant.version)){
//       var version = cache.get(SharedPreferenceConstant.version);
//       debugPrint("$version");
//       return version;
//     } else {
//       final info = await PackageInfo.fromPlatform();
//       cache.put(SharedPreferenceConstant.version, info.version,
//           const Duration(hours: 24));
//       return info.version;
//     }
//   }
// }

getVersion() async {
  final BaseCache cache = serviceLocator<BaseCache>();
  if(await cache.has(SharedPreferenceConstant.version)){
    var version = cache.get(SharedPreferenceConstant.version);
    debugPrint("$version");
    return version;
  } else {
    final info = await PackageInfo.fromPlatform();
    cache.put(SharedPreferenceConstant.version, info.version,
        const Duration(hours: 24));
    return info.version;
  }
}
*/
