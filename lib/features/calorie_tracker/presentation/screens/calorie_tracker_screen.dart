import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/comman_app_bar.dart';
import '../providers/calorie_provider.dart';

class CalorieTrackerScreen extends ConsumerStatefulWidget {
  const CalorieTrackerScreen({super.key});

  @override
  ConsumerState<CalorieTrackerScreen> createState() => _CalorieTrackerScreenState();
}

class _CalorieTrackerScreenState extends ConsumerState<CalorieTrackerScreen> {
  final _mealCtrl = TextEditingController();
  final _calCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calorieNotifierProvider);
    final notifier = ref.read(calorieNotifierProvider.notifier);
    final progress = state.total / CalorieNotifier.dailyTarget;
    final exceeded = state.total > CalorieNotifier.dailyTarget;

    return Scaffold(
      appBar: const CommonAppBar(title: 'Calorie Tracker'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: TextField(controller: _mealCtrl, decoration: const InputDecoration(labelText: 'Meal name')),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: TextField(controller: _calCtrl, decoration: const InputDecoration(labelText: 'kcal'), keyboardType: TextInputType.number),
              )
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: ElevatedButton(onPressed: () async {
                  final name = _mealCtrl.text.trim();
                  final cal = int.tryParse(_calCtrl.text.trim()) ?? 0;
                  if (name.isEmpty || cal <= 0) return;
                  await notifier.logMeal(name, cal);
                  _mealCtrl.clear();
                  _calCtrl.clear();
                }, child: const Text('Log Meal')),
              )
            ]),
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                minHeight: 14,
                value: progress.clamp(0, 1),
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(exceeded ? AppColors.accent : AppColors.primary),
              ),
            ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('${state.total} / ${CalorieNotifier.dailyTarget} kcal', style: TextStyle(fontWeight: FontWeight.bold, color: exceeded ? AppColors.accent : AppColors.textPrimary)),
              if (exceeded) Text('Limit exceeded', style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold))
            ]),
            const SizedBox(height: 12),
            Expanded(
              child: state.meals.isEmpty
                  ? Center(child: Text('No meals logged yet', style: TextStyle(color: Colors.grey[600])))
                  : ListView.builder(
                      itemCount: state.meals.length,
                      itemBuilder: (context, i) {
                        final m = state.meals[i];
                        return Card(
                          child: ListTile(
                            title: Text(m.name),
                            trailing: Text('${m.calories} kcal'),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}