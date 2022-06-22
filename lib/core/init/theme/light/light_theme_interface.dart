import 'package:socket_chat/core/init/theme/light/light_color_schema.dart';
import 'package:socket_chat/core/init/theme/light/light_text_theme.dart';

abstract class ILightTheme {
  LightColorSchema? colorSchema = LightColorSchema.schema;
  LightTextTheme? textColor = LightTextTheme.color;
}
