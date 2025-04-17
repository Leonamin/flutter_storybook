import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/foundation/color/theme_color_hue.dart';

class CommonDropdownButton<T> extends StatelessWidget {
  // UI
  final double? radius;
  final EdgeInsetsGeometry? padding;

  // Data
  final T value;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;

  const CommonDropdownButton({
    super.key,
    this.radius,
    this.padding,
    required this.value,
    this.onChanged,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColorHue.borderPrimary.light,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: DropdownButton<T>(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        value: value,
        onChanged: onChanged,
        isDense: true,
        isExpanded: true,
        iconEnabledColor: ThemeColorHue.iconPrimary.light,
        icon: Icon(
          Icons.arrow_drop_down,
          color: ThemeColorHue.iconDisabled.light,
        ),
        alignment: Alignment.centerLeft,
        underline: const SizedBox.shrink(),
        elevation: 1,
        items: items,
      ),
    );
  }
}
