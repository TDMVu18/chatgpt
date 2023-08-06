import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeThemeProvider = StateProvider(
  (ref) => Themes.dark,
);

enum Themes {
  dark,
  light,
}
