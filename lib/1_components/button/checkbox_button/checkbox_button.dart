import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/foundation/color/theme_color_hue.dart';

class CheckBoxButton extends StatefulWidget {
  const CheckBoxButton({
    super.key,
    required this.isChecked,
    this.onTap,
    this.size,
    this.margin,
    this.borderRadius,
    this.debounceTime,
  });

  final bool isChecked;
  final Function()? onTap;
  final double? size;
  final double? margin;
  final double? borderRadius;
  final int? debounceTime;

  factory CheckBoxButton.form({
    Key? key,
    required bool isChecked,
    Function()? onTap,
  }) {
    return CheckBoxButton(
      key: key,
      isChecked: isChecked,
      onTap: onTap,
      borderRadius: 0,
      size: 18,
    );
  }

  @override
  State<CheckBoxButton> createState() => _CheckBoxButtonState();
}

class _CheckBoxButtonState extends State<CheckBoxButton> {
  bool _isHover = false;
  bool get _isChecked => widget.isChecked;
  bool get _isDisabled => widget.onTap == null;

  // fill Color
  Color? get _fillColor {
    if (_isDisabled) return ThemeColorHue.bgPrimary.light;
    if (_isChecked) return ThemeColorHue.bgBrand.light;
    return ThemeColorHue.bgPrimary.light;
  }

  // border
  Border? get _border => Border.all(color: _borderColor);

  Color get _borderColor {
    if (_isDisabled) return ThemeColorHue.borderPrimary.light;
    if (_isChecked) return ThemeColorHue.bgBrand.light;
    if (_isHover) return ThemeColorHue.borderPrimaryHoverPressed.light;
    return ThemeColorHue.borderPrimary.light;
  }

  // icon Color
  Color get _iconColor {
    if (_isDisabled) return ThemeColorHue.borderPrimary.light;
    if (_isChecked) return ThemeColorHue.bgPrimary.light;
    if (_isHover) return ThemeColorHue.bgPrimary.light;
    return ThemeColorHue.borderPrimary.light;
  }

  // boxShadow
  List<BoxShadow>? get _boxShadow {
    if (_isDisabled) return null;
    // if (_isChecked && _isHover) return BoxDecorations.activeShadow;
    // if (_isHover) return BoxDecorations.inActiveShadow;
    return null;
  }

  /// in milliseconds
  late int? debounceTime = widget.debounceTime ?? 600;
  DateTime? _lastClickTime;

  void _debounceTap() {
    final now = DateTime.now();
    if (_lastClickTime == null) {
      _lastClickTime = now;
      _click();
    } else {
      if (now.difference(_lastClickTime!).inMilliseconds > debounceTime!) {
        _lastClickTime = now;
        _click();
      }
    }
  }

  void _click() {
    widget.onTap?.call();
  }

  double get _checkBoxSize => widget.size ?? 16;

  double get _iconSize => _checkBoxSize * 0.7;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _debounceTap,
      onTapDown: (_) => setState(() => _isHover = true),
      onTapUp: (_) => setState(() => _isHover = false),
      onTapCancel: () => setState(() => _isHover = false),
      child: Container(
        width: _checkBoxSize,
        height: _checkBoxSize,
        margin: EdgeInsets.all(widget.margin ?? 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
          color: _fillColor,
          border: _border,
          boxShadow: _boxShadow,
        ),
        child: Icon(
          Icons.check,
          color: _iconColor,
          size: _iconSize,
        ),
      ),
    );
  }
}
