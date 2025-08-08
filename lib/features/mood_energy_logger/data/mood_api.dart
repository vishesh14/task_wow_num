class MoodApi {
  Map<String, dynamic>? _today;

  Future<Map<String, dynamic>?> getToday() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _today;
  }

  Future<Map<String, dynamic>> postMood(String mood, int energy) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _today = { 'mood': mood, 'energy': energy, 'timestamp': DateTime.now().toIso8601String() };
    return _today!;
  }
}