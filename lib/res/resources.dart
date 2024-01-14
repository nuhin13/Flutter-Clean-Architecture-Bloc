import 'package:flutter/cupertino.dart';
import '../../res/drawable/app_drawable.dart';
import '../core/core_export.dart';
import 'strings/strings.dart';

class Resources {

  final BuildContext _context;
  Resources(this._context);

  CommonStrings? get strings {
    return Localizations.of<CommonStrings>(_context, CommonStrings);
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  AppTextStyle get style {
    return AppTextStyle();
  }

  AppDrawable get drawable {
    return AppDrawable();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}