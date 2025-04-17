import 'package:flutter/material.dart';
import 'package:flutter_storybook/1_components/button/solid_button/button_color_set.dart';
import 'package:flutter_storybook/1_components/button/solid_button/button_size.dart';
import 'package:flutter_storybook/1_components/button/solid_button/solid_button.dart';
import 'package:flutter_storybook/2_view/stories/0_data/setting_item.dart';
import 'package:flutter_storybook/2_view/stories/0_data/setting_item_type.dart';
import 'package:flutter_storybook/2_view/stories/base_story_page.dart';

class StoryPageSolidButtonViewModel extends ChangeNotifier {
  List<SettingItem> get settingItems => [
        SettingItem(
          title: '버튼 라벨',
          settingItemType: SettingItemType.textBox,
          onValueChanged: (value) => handleLabelChanged(value),
        ),
        SettingItem(
          title: '버튼 색상',
          settingItemType: SettingItemType.dropdown,
          onValueChanged: (value) => handleButtonColorSet(value),
          selectableValues:
              ButtonColorSet.values.map((e) => e.toString()).toList(),
        ),
        SettingItem(
          title: '버튼 크기',
          settingItemType: SettingItemType.dropdown,
          onValueChanged: (value) => handleButtonSizeChanged(value),
          selectableValues: ButtonSize.values.map((e) => e.toString()).toList(),
        ),
      ];

  String buttonLabel = 'SolidButton';
  ButtonSize selectedButtonSize = ButtonSize.tiny;
  ButtonColorSet selectedColorSet = ButtonColorSet.primary;

  void handleLabelChanged(String value) {
    buttonLabel = value;
    notifyListeners();
  }

  void handleButtonSizeChanged(String value) {
    selectedButtonSize = ButtonSize.parseFromString(value);
    notifyListeners();
  }

  void handleButtonColorSet(String value) {
    selectedColorSet = ButtonColorSet.parseFromString(value);
    notifyListeners();
  }
}

class StoryPageSolidButton extends StatefulWidget {
  const StoryPageSolidButton({super.key});

  @override
  State<StoryPageSolidButton> createState() => _StoryPageSolidButtonState();
}

class _StoryPageSolidButtonState extends State<StoryPageSolidButton> {
  final vm = StoryPageSolidButtonViewModel();

  @override
  void initState() {
    super.initState();

    vm.addListener(() {
      if (context.mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseStoryPage(
      settings: vm.settingItems,
      child: SolidButton(
        text: vm.buttonLabel,
        buttonSize: vm.selectedButtonSize,
        colorSet: vm.selectedColorSet,
      ),
    );
  }
}
