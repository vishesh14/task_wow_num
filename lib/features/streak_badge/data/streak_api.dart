class StreakApi {
  int streak = 3;

  Future<int> getStreak() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return streak;
  }

  Future<int> incrementStreak() async {
    await Future.delayed(const Duration(milliseconds: 300));
    streak += 1;
    return streak;
  }

  Future<void> resetStreak() async {
    await Future.delayed(const Duration(milliseconds: 200));
    streak = 0;
  }
}