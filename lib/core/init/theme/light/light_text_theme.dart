class LightTextTheme {
  static LightTextTheme? _color;

  static LightTextTheme? get color {
    _color ??= LightTextTheme._init();
    return _color;
  }

  LightTextTheme._init();
}
