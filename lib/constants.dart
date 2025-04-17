import 'package:flutter_storybook/0_data/models/component_story.dart';
import 'package:flutter_storybook/0_data/models/story_category.dart';
import 'package:flutter_storybook/0_data/models/story_group.dart';
import 'package:flutter_storybook/2_view/stories/story_page_solid_button.dart';

class Constants {
  static final stories = [
    StoryGroup(
      storyCategory: StoryCategory.theme,
      stories: [],
    ),
    StoryGroup(
      storyCategory: StoryCategory.buttons,
      stories: [
        ComponentStory(
          title: 'SolidButton',
          pageBuilder: (context) => StoryPageSolidButton(),
        ),
      ],
    ),
    StoryGroup(
      storyCategory: StoryCategory.textFields,
      stories: [],
    ),
  ];
}
