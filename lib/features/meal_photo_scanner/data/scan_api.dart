class ScanApi {
  Future<Map<String, dynamic>> scanImage(String filename) async {
    await Future.delayed(const Duration(milliseconds: 700));
    // Return a dummy meal + calories based on filename hash
    final cal = (filename.length * 37) % 800 + 100;
    return {
      'meal': 'Scanned ${filename.split('/').last}',
      'calories': cal,
    };
  }
}