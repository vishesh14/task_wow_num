import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/comman_app_bar.dart';
import '../provider/streak_provider.dart';

class StreakScreen extends ConsumerWidget {
  const StreakScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streakAsync = ref.watch(streakProvider);
    final api = ref.read(streakActionProvider);

    return Scaffold(
      appBar: const CommonAppBar(title: 'Streak Badge'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
                child: Lottie.asset('assets/lottie/badge.json',
                    width: 180, height: 180, repeat: true)),
            const SizedBox(height: 10),
            streakAsync.when(
              data: (streak) => Column(children: [
                Text('$streak-Day Streak',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Keep logging daily to increase your streak!')
              ]),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Text('Error: $e'),
            ),
            const SizedBox(height: 18),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () async {
                        await api.incrementStreak();
                        ref.invalidate(streakProvider);
                      },
                      child: const Text('Log Activity'))),
            ])
          ],
        ),
      ),
    );
  }
}
