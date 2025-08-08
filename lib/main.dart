import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wow_num/core/theme/app_theme.dart';

import 'features/calorie_tracker/presentation/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Coach Demo',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}

