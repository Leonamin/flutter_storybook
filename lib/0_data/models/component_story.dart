import 'package:flutter/material.dart';

class ComponentStory {
  final String title;
  final WidgetBuilder pageBuilder;
  final String sourceCode;
  final String exampleCode;

  const ComponentStory({
    required this.title,
    required this.pageBuilder,
    this.sourceCode = '',
    this.exampleCode = '',
  });
}
