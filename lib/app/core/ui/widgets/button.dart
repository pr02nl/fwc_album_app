import 'package:flutter/material.dart';
import 'package:fwc_albim_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_albim_app/app/core/ui/styles/text_styles.dart';

class Button extends StatelessWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? heigth;
  final VoidCallback? onPressed;
  final bool outline;

  const Button({
    super.key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.heigth,
    this.onPressed,
    this.outline = false,
  });

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.heigth,
    this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        labelStyle = TextStyles.i.textPrimaryFontExtraBold,
        outline = false;

  @override
  Widget build(BuildContext context) {
    final labelText = Text(
      label,
      style: labelStyle,
      overflow: TextOverflow.ellipsis,
    );
    return SizedBox(
      width: width,
      height: heigth,
      child: outline
          ? OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: labelText,
            ),
    );
  }
}
