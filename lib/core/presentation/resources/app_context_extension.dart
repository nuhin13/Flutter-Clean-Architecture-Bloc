
import 'package:flutter/cupertino.dart';
import '../../../res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}