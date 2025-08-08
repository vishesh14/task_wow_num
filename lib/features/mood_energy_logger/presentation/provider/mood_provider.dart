import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wow_num/features/mood_energy_logger/data/mood_api.dart';

final moodApi = Provider((ref) => MoodApi());
final todayMoodProvider = FutureProvider<Map<String, dynamic>?>((ref) async => ref.read(moodApi).getToday());