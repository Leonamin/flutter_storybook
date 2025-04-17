import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/button/dropdown_button/common_dropdown_button.dart';
import 'package:flutter_storybook/1_components/button/radio_button/radio_button.dart';
import 'package:flutter_storybook/1_components/scaffold/safe_scaffold/safe_scaffold.dart';
import 'package:flutter_storybook/2_view/stories/0_data/setting_item.dart';
import 'package:flutter_storybook/2_view/stories/0_data/setting_item_type.dart';
import 'package:flutter_storybook/7_utils/text_widget_util.dart';

class BaseStoryPage extends StatelessWidget {
  final List<SettingItem> settings;
  final Widget child;

  const BaseStoryPage({
    super.key,
    required this.settings,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: child,
          ),
          Expanded(
            flex: 1,
            child: _SettingPanel(
              settingItems: settings,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingPanel extends StatelessWidget {
  final List<SettingItem> settingItems;

  final TextStyle? textStyle;

  const _SettingPanel({
    required this.settingItems,
    this.textStyle,
  });

  TextStyle get _textStyle =>
      textStyle ??
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  List<String> get _texts => settingItems.map((e) => e.title).toList();

  double get _maxTextWidth {
    if (_texts.isEmpty) return 0;
    return TextWidgetUtil.getMaxTextWidth(
      texts: _texts,
      style: _textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        for (final settingItem in settingItems)
          _SettingItemTile(
            setting: settingItem,
            textWidth: _maxTextWidth,
            textStyle: _textStyle,
          ),
      ],
    );
  }
}

class _SettingItemTile extends StatelessWidget {
  final SettingItem setting;
  final double textWidth;
  final TextStyle textStyle;

  const _SettingItemTile({
    required this.setting,
    required this.textWidth,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: textWidth,
          child: Text(
            setting.title,
            style: textStyle,
          ),
        ),
        Expanded(
          child: _buildSettingItemValueSelector(context),
        )
      ],
    );
  }

  Widget _buildSettingItemValueSelector(BuildContext context) {
    switch (setting.settingItemType) {
      case SettingItemType.textBox:
        return _TextFieldSettingItemTile(settingItem: setting);
      case SettingItemType.dropdown:
        return _DropdownSettingItemTile(settingItem: setting);
      case SettingItemType.radio:
        return _RadioSettingItemTile(settingItem: setting);
    }
  }
}

class _TextFieldSettingItemTile extends StatelessWidget {
  final SettingItem settingItem;

  const _TextFieldSettingItemTile({
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    final tc = TextEditingController(text: settingItem.selectedValue ?? '');

    return TextField(
      controller: tc,
      onChanged: (value) => settingItem.onValueChanged(value),
    );
  }
}

class _DropdownSettingItemTile extends StatelessWidget {
  final SettingItem settingItem;

  const _DropdownSettingItemTile({
    required this.settingItem,
  });

  @override
  Widget build(BuildContext context) {
    return CommonDropdownButton<String?>(
      value: settingItem.selectableValues.contains(settingItem.selectedValue)
          ? settingItem.selectedValue
          : null,
      items: settingItem.selectableValues
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (value) {
        settingItem.onValueChanged(value ?? '');
      },
    );
  }
}

class _RadioSettingItemTile extends StatelessWidget {
  final SettingItem settingItem;

  const _RadioSettingItemTile({
    required this.settingItem,
  });

  bool get _isSelected => settingItem.selectedValue == 'true';

  @override
  Widget build(BuildContext context) {
    return RadioButton(
      isSelected: _isSelected,
      onTap: () => settingItem.onValueChanged((!_isSelected).toString()),
    );
  }
}
