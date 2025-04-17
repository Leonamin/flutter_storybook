enum StoryCategory {
  theme,
  buttons,
  textFields;

  @override
  String toString() {
    switch (this) {
      case StoryCategory.theme:
        return 'THEME';
      case StoryCategory.buttons:
        return 'BUTTONS';
      case StoryCategory.textFields:
        return 'TEXT FIELDS';
    }
  }
}
