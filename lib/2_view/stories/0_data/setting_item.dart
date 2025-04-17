import 'package:flutter_storybook/2_view/stories/0_data/setting_item_type.dart';

class SettingItem {
  final String title;
  final String? selectedValue;

  final SettingItemType settingItemType;

  final Function(String value) onValueChanged;
  final List<String> selectableValues;

  SettingItem({
    required this.title,
    this.selectedValue,
    required this.settingItemType,
    required this.onValueChanged,
    this.selectableValues = const [],
  });
}