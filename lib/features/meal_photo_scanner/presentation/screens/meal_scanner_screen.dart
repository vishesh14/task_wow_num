import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wow_num/features/meal_photo_scanner/presentation/provider/scan_provider.dart';

import '../../../../core/widgets/comman_app_bar.dart';

class MealScannerScreen extends ConsumerStatefulWidget {
  const MealScannerScreen({super.key});

  @override
  ConsumerState<MealScannerScreen> createState() => _MealScannerScreenState();
}

class _MealScannerScreenState extends ConsumerState<MealScannerScreen> {
  String? _pickedFile;

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(scanResultProvider);
    final api = ref.read(scanApi);

    return Scaffold(
      appBar: const CommonAppBar(title: 'Meal Photo Scanner'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          GestureDetector(
            onTap: () async {
              // simulate picking a file
              setState(() => _pickedFile = 'assets/images/food.png');
            },
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: _pickedFile == null
                  ? const Center(child: Text('Tap to select or take photo', style: TextStyle(color: Colors.grey)))
                  : ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(_pickedFile!, fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: ElevatedButton(onPressed: _pickedFile == null ? null : () async {
              final res = await ref.read(scanApi).scanImage(_pickedFile!);
              ref.read(scanResultProvider.notifier).state = res;
            }, child: const Text('Scan Photo'))),
          ]),
          const SizedBox(height: 18),
          if (result != null) Card(child: ListTile(title: Text(result['meal']), subtitle: Text('${result['calories']} kcal')))
        ]),
      ),
    );
  }
}