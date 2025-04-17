import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/foundation/color/theme_color_hue.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    super.key,
    required this.isSelected,
    this.onTap,
    this.size,
    this.hitAreaSize,
  });

  final Function()? onTap;
  final bool isSelected;
  final double? size;
  final double? hitAreaSize;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  bool _isHover = false;
  bool get _isSelected => widget.isSelected;
  bool get _isDisabled => widget.onTap == null;

  Border _border(BuildContext context) {
    if (_isDisabled) {
      return Border.all(
        color: ThemeColorHue.borderPrimary.light,
        width: 2,
      );
    }

    if (_isSelected) {
      return Border.all(
        color: ThemeColorHue.bgBrand.light,
        width: 6,
      );
    }

    if (_isHover) {
      return Border.all(
        color: ThemeColorHue.borderPrimaryHoverPressed.light,
        width: 2,
      );
    }

    return Border.all(
      color: ThemeColorHue.borderPrimary.light,
      width: 2,
    );
  }

  // fillColor
  Color get _fillColor {
    if (_isDisabled) {
      return ThemeColorHue.bgTertiary.light;
    }

    return ThemeColorHue.bgPrimary.light;
  }

  // boxShadow
  List<BoxShadow>? get _boxShadow {
    if (_isDisabled) return null;
    // if (_isSelected && _isHover) return BoxDecorations.activeShadow;
    // if (_isHover) return BoxDecorations.inActiveShadow;

    return null;
  }

  @override
  didUpdateWidget(RadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isHover = true),
      onTapUp: (_) => setState(() => _isHover = false),
      onTapCancel: () => setState(() => _isHover = false),
      child: Container(
        margin: EdgeInsets.all(widget.hitAreaSize ?? 2),
        width: widget.size ?? 20,
        height: widget.size ?? 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _fillColor,
          border: _border(context),
          boxShadow: _boxShadow,
        ),
      ),
    );
  }
}
