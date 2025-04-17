import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/button/solid_button/button_color_set.dart';
import 'package:flutter_storybook/1_components/button/solid_button/button_size.dart';

// 일반
// 호버링, 클릭
// 비활성화
class SolidButton extends StatelessWidget {
  final dynamic text;
  final Color? textColor;

  final double? iconSpacing;

  /// 오른쪽에 위치할 아이콘
  final Widget? followingIcon;

  /// 왼쪽에 위치할 아이콘
  final Widget? leadingIcon;

  final EdgeInsetsGeometry? padding;

  /// 버튼의 최소 높이
  final double? minHeight;

  /// 버튼의 최소 너비
  final double? minWidth;

  final double? borderRadius;

  final ButtonSize buttonSize;
  final ButtonColorSet colorSet;

  final bool isOutline;

  final bool isExpanded;

  final VoidCallback? onTap;

  const SolidButton({
    super.key,
    this.text,
    this.textColor,
    this.followingIcon,
    this.leadingIcon,
    this.iconSpacing,
    this.padding,
    this.minHeight,
    this.minWidth,
    this.borderRadius,
    this.isOutline = false,
    this.isExpanded = false,
    required this.buttonSize,
    required this.colorSet,
    this.onTap,
  });

  static const _defaultIconSpacing = 4.0;

  Color _color(BuildContext context) => colorSet.color(context);
  Color _highlightColor(BuildContext context) =>
      colorSet.highlightColor(context);
  Color _borderColor(BuildContext context) => colorSet.borderColor(context);
  Color _highlightBorderColor(BuildContext context) =>
      colorSet.highlightBorderColor(context);

  bool get isDisabled => onTap == null;

  Widget _buildCenter() {
    Widget child;

    if (text is Widget) {
      child = text;
    } else if (text is String) {
      child = Text.rich(
        TextSpan(
          children: [
            if (leadingIcon != null) ...[
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle, child: leadingIcon!),
              WidgetSpan(
                child: SizedBox(width: iconSpacing ?? _defaultIconSpacing),
              )
            ],
            TextSpan(text: text),
            if (followingIcon != null) ...[
              WidgetSpan(
                  child: SizedBox(width: iconSpacing ?? _defaultIconSpacing)),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: followingIcon!),
            ]
          ],
        ),
        textAlign: TextAlign.center,
        style: buttonSize.textStyle,
      );
    } else {
      child = const SizedBox.shrink();
    }

    return isExpanded ? Expanded(child: child) : child;
  }

  // text가 String이 아닌경우 아래 build()에서 빌드한다.
  bool get _buildIconAsWidget {
    return text is! String;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: buttonSize.minHeight,
        minWidth: minWidth ?? 0,
      ),
      child: _BaseButton(
        onTap: onTap,
        color: _color(context),
        highlightColor: _highlightColor(context),
        borderColor: _borderColor(context),
        highlightBorderColor: _highlightBorderColor(context),
        borderRadius: borderRadius,
        isOutline: isOutline,
        child: Padding(
          padding: padding ?? buttonSize.padding,
          child: Row(
            mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: iconSpacing ?? _defaultIconSpacing,
            children: [
              if (_buildIconAsWidget && leadingIcon != null) leadingIcon!,
              _buildCenter(),
              if (_buildIconAsWidget && followingIcon != null) followingIcon!,
            ],
          ),
        ),
      ),
    );
  }
}

class _BaseButton extends StatefulWidget {
  const _BaseButton({
    this.onTap,
    required this.color,
    required this.highlightColor,
    required this.borderColor,
    required this.highlightBorderColor,
    this.borderRadius,
    this.isOutline = false,
    required this.child,
  });

  final VoidCallback? onTap;
  final Color color;
  final Color highlightColor;
  final Color borderColor;
  final Color highlightBorderColor;
  final double? borderRadius;
  final bool isOutline;
  final Widget child;

  @override
  State<_BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<_BaseButton> {
  bool _showHighlightColor = false;

  bool get _isEnabled => widget.onTap != null;

  Color get _color => widget.color;
  Color get _highlightColor => widget.highlightColor;
  Color get _borderColor => widget.borderColor;
  Color get _highlightBorderColor => widget.highlightBorderColor;

  Color get _curDecoColor =>
      _showHighlightColor && _isEnabled ? _highlightColor : _color;

  Color get _curDecoBorderColor =>
      _showHighlightColor && _isEnabled ? _highlightBorderColor : _borderColor;

  static const _defaultDisabledOpacity = 0.3;

  double get _disabledOpacity => _defaultDisabledOpacity;

  BorderRadius get _borderRadius =>
      BorderRadius.circular(widget.borderRadius ?? 8);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _isEnabled ? 1 : _disabledOpacity,
      child: GestureDetector(
        onTap: _tap,
        onTapDown: (_) => _changeHighlightColor(true),
        onTapUp: (_) => _changeHighlightColor(false),
        onTapCancel: () => _changeHighlightColor(false),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: _curDecoColor,
            border: widget.isOutline
                ? Border.all(color: _curDecoBorderColor)
                : null,
            borderRadius: _borderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }

  void _changeHighlightColor(bool isHighlight) {
    if (!_isEnabled) return;
    setState(() => _showHighlightColor = isHighlight);
  }

  void _tap() {
    widget.onTap?.call();
  }
}
