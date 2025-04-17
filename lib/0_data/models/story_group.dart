import 'package:flutter_storybook/0_data/models/component_story.dart';
import 'package:flutter_storybook/0_data/models/story_category.dart';

class StoryGroup {
  final StoryCategory storyCategory;
  final List<ComponentStory> stories;

  const StoryGroup({
    required this.storyCategory,
    required this.stories,
  });
}
