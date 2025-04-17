import 'package:flutter/material.dart';
import 'package:flutter_storybook/0_data/models/component_story.dart';
import 'package:flutter_storybook/0_data/models/story_group.dart';
import 'package:flutter_storybook/constants.dart';

class MainStoryViewModel extends ChangeNotifier {
  final List<StoryGroup> _stories = Constants.stories;
  List<StoryGroup> get stories => _stories;

  ComponentStory? _selectedStory;

  ComponentStory? get selectedStory => _selectedStory;

  /// actions
  void changeSelectedStory(ComponentStory story) {
    _selectedStory = story;
    notifyListeners();
  }
}
