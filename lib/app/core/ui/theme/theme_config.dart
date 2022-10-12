import 'package:flutter/material.dart';
import 'package:fwc_albim_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_albim_app/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(
      color: ColorsApp.i.greyDark,
      width: 1,
    ),
  );
  ThemeConfig._();
  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.i.primary,
      primary: ColorsApp.i.primary,
      secondary: ColorsApp.i.secundary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      labelStyle: TextStyles.i.labelTextField,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      border: _defaultInputBorder,
    ),
  );
}
