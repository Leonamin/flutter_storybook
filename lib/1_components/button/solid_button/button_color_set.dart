import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/foundation/color/theme_color_hue.dart';

enum ButtonColorSet {
  primary,
  secondary,
  tertiary,
  outline,
  error;

  static ButtonColorSet parseFromString(String value) {
    return ButtonColorSet.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => ButtonColorSet.primary,
    );
  }

  Color color(BuildContext context) {
    switch (this) {
      case ButtonColorSet.primary:
        return ThemeColorHue.bgBrand.getColor(context);
      case ButtonColorSet.secondary:
        return ThemeColorHue.bgSecondary.getColor(context);
      case ButtonColorSet.tertiary:
        return ThemeColorHue.bgTertiary.getColor(context);
      case ButtonColorSet.outline:
        return ThemeColorHue.bgPrimary.getColor(context);
      case ButtonColorSet.error:
        return ThemeColorHue.bgDanger.getColor(context);
    }
  }

  /// hover & pressed color
  Color highlightColor(BuildContext context) {
    switch (this) {
      case ButtonColorSet.primary:
        return ThemeColorHue.bgBrandHoverPressed.getColor(context);
      case ButtonColorSet.secondary:
        return ThemeColorHue.bgSecondaryHoverPressed.getColor(context);
      case ButtonColorSet.tertiary:
        return ThemeColorHue.bgTertiaryHoverPressed.getColor(context);
      case ButtonColorSet.outline:
        return ThemeColorHue.bgPrimaryHoverPressed.getColor(context);
      case ButtonColorSet.error:
        return ThemeColorHue.bgBrandHoverPressed.getColor(context);
    }
  }

  /// border color
  Color borderColor(BuildContext context) {
    switch (this) {
      case ButtonColorSet.primary:
        return ThemeColorHue.bgBrand.getColor(context);
      case ButtonColorSet.secondary:
        return ThemeColorHue.bgSecondary.getColor(context);
      case ButtonColorSet.tertiary:
        return ThemeColorHue.bgTertiary.getColor(context);
      case ButtonColorSet.outline:
        return ThemeColorHue.borderPrimary.getColor(context);
      case ButtonColorSet.error:
        return ThemeColorHue.bgDanger.getColor(context);
    }
  }

  /// border highlight color
  Color highlightBorderColor(BuildContext context) {
    switch (this) {
      case ButtonColorSet.primary:
        return ThemeColorHue.bgBrand.getColor(context);
      case ButtonColorSet.secondary:
        return ThemeColorHue.bgSecondary.getColor(context);
      case ButtonColorSet.tertiary:
        return ThemeColorHue.bgTertiary.getColor(context);
      case ButtonColorSet.outline:
        return ThemeColorHue.borderPrimaryHoverPressed.getColor(context);
      case ButtonColorSet.error:
        return ThemeColorHue.bgDanger.getColor(context);
    }
  }

  /// textColor
  Color textColor(BuildContext context) {
    switch (this) {
      case ButtonColorSet.primary:
        return ThemeColorHue.textInverse.getColor(context);
      case ButtonColorSet.secondary:
        return ThemeColorHue.textPrimary.getColor(context);
      case ButtonColorSet.tertiary:
        return ThemeColorHue.textPrimaryHoverPressed.getColor(context);
      case ButtonColorSet.outline:
        return ThemeColorHue.textPrimaryHoverPressed.getColor(context);
      case ButtonColorSet.error:
        return ThemeColorHue.textInverse.getColor(context);
    }
  }
}
