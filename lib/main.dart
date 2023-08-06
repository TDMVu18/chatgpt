import 'package:app/constant/theme.dart';
import 'package:app/provider/activeprovidertheme.dart';
import 'package:app/screen/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
        home: const ChatScreen());
  }
}
