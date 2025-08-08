import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/streak_api.dart';

final _streakApi = Provider((ref) => StreakApi());
final streakProvider = FutureProvider<int>((ref) async {
  final api = ref.read(_streakApi);
  return api.getStreak();
});

final streakActionProvider = Provider((ref) => ref.read(_streakApi));