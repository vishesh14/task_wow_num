import 'package:flutter/material.dart';

import '../../../ai_coach/presentation/screens/ai_coach_screen.dart';
import '../../../meal_photo_scanner/presentation/screens/meal_scanner_screen.dart';
import '../../../mood_energy_logger/presentation/screens/mood_energy_screen.dart';
import '../../../streak_badge/presentation/screens/streak_screen.dart';
import '../../presentation/screens/calorie_tracker_screen.dart';

class HomeItem {
  final String title;
  final IconData icon;
  final Color color;
  final Widget screen;

  const HomeItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.screen,
  });
}

class HomeItems {
  static const List<HomeItem> all = [
    HomeItem(
      title: 'Daily Calorie Tracker',
      icon: Icons.local_dining,
      color: Colors.orange,
      screen: CalorieTrackerScreen(),
    ),
    HomeItem(
      title: 'Streak Badge',
      icon: Icons.star,
      color: Colors.purple,
      screen: StreakScreen(),
    ),
    HomeItem(
      title: 'Meal Photo Scanner',
      icon: Icons.camera_alt,
      color: Colors.blue,
      screen: MealScannerScreen(),
    ),
    HomeItem(
      title: 'Chat with AI Coach',
      icon: Icons.chat_bubble_outline,
      color: Colors.green,
      screen: AiCoachScreen(),
    ),
    HomeItem(
      title: 'Mood & Energy Logger',
      icon: Icons.mood,
      color: Colors.teal,
      screen: MoodEnergyScreen(),
    ),
  ];
}

