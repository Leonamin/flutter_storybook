import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/foundation/text_styles.dart';

enum ButtonSize {
  tiny,

  /// size 34
  small,

  /// size 36
  medium,

  /// size 40
  large,

  /// size 48
  extraLarge; // 48

  static ButtonSize parseFromString(String value) {
    return ButtonSize.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => ButtonSize.tiny,
    );
  }
}

extension BaseButtonSizeExt on ButtonSize {
  double get minHeight {
    switch (this) {
      case ButtonSize.tiny:
        return 26;
      case ButtonSize.small:
        return 34;
      case ButtonSize.medium:
        return 36;
      case ButtonSize.large:
        return 40;
      case ButtonSize.extraLarge:
        return 48;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.tiny:
        return const EdgeInsets.symmetric(horizontal: 6, vertical: 4);
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case ButtonSize.extraLarge:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case ButtonSize.tiny:
        return TextStyles.caption2;
      case ButtonSize.small:
        return TextStyles.caption1;
      case ButtonSize.medium:
        return TextStyles.body2;
      case ButtonSize.large:
        return TextStyles.body2;
      case ButtonSize.extraLarge:
        return TextStyles.body1;
    }
  }

  double get iconSize {
    switch (this) {
      case ButtonSize.tiny:
        return 16;
      case ButtonSize.small:
        return 18;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 20;
      case ButtonSize.extraLarge:
        return 24;
    }
  }
}
