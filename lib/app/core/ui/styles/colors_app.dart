import 'package:flutter/cupertino.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff791435);
  Color get secundary => const Color(0xfffdce50);
  Color get yellow => const Color(0xfffdce50);
  Color get grey => const Color(0xffcccccc);
  Color get greyDark => const Color(0xff999999);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
