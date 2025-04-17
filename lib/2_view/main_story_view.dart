import 'package:flutter/material.dart';
import 'package:flutter_storybook/0_data/models/component_story.dart';
import 'package:flutter_storybook/0_data/models/story_group.dart';
import 'package:flutter_storybook/1_components/scaffold/safe_scaffold/safe_scaffold.dart';
import 'package:flutter_storybook/2_view/main_story_view_model.dart';

class MainStroyView extends StatefulWidget {
  const MainStroyView({super.key});

  @override
  State<MainStroyView> createState() => _MainStroyViewState();
}

class _MainStroyViewState extends State<MainStroyView> {
  final vm = MainStoryViewModel();

  @override
  void initState() {
    super.initState();

    vm.addListener(() {
      if (context.mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Story List
          Expanded(
            flex: 1,
            child: _StoryPannel(
              stories: vm.stories,
              onTapStory: (story) => vm.changeSelectedStory(story),
            ),
          ),
          // Selected Story Screen
          Expanded(
            flex: 4,
            child: _SelectedStoryScreen(
              selectedStory: vm.selectedStory,
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryPannel extends StatelessWidget {
  final List<StoryGroup> stories;

  final Function(ComponentStory story) onTapStory;

  const _StoryPannel({
    required this.stories,
    required this.onTapStory,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ExpansionTile(
          initiallyExpanded: true,
          title: Text(
            stories[index].storyCategory.toString(),
          ),
          children: [
            for (final story in stories[index].stories)
              ListTile(
                title: Text(story.title),
                onTap: () => onTapStory(story),
              ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 32,
      ),
      itemCount: stories.length,
    );
  }
}

class _SelectedStoryScreen extends StatelessWidget {
  final ComponentStory? selectedStory;

  const _SelectedStoryScreen({
    required this.selectedStory,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedStory == null) {
      return Center(
        child: Text('스토리를 선택해주세요!'),
      );
    }
    return selectedStory!.pageBuilder(context);
  }
}
