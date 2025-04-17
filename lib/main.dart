import 'package:flutter/material.dart';
import 'package:flutter_storybook/2_view/main_story_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainStroyView(),
    );
  }
}
