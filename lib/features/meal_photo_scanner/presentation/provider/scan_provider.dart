import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wow_num/features/meal_photo_scanner/data/scan_api.dart';

final scanApi = Provider((ref) => ScanApi());
final scanResultProvider = StateProvider<Map<String, dynamic>?>((ref) => null);