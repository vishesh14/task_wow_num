import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wow_num/core/theme/app_theme.dart';
import 'package:wow_num/features/mood_energy_logger/presentation/provider/mood_provider.dart';

import '../../../../core/widgets/comman_app_bar.dart';

class MoodEnergyScreen extends ConsumerStatefulWidget {
  const MoodEnergyScreen({super.key});

  @override
  ConsumerState<MoodEnergyScreen> createState() => _MoodEnergyScreenState();
}

class _MoodEnergyScreenState extends ConsumerState<MoodEnergyScreen> {
  String _mood = '🙂';
  double _energy = 5;

  @override
  Widget build(BuildContext context) {
    final todayAsync = ref.watch(todayMoodProvider);
    final api = ref.read(moodApi);

    return Scaffold(
      appBar: const CommonAppBar(title: 'Mood & Energy'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text('How are you feeling today?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _emojiButton('😃'),
            _emojiButton('🙂'),
            _emojiButton('😐'),
            _emojiButton('😟'),
            _emojiButton('😴'),
          ]),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Energy: ${_energy.round()}'), SizedBox(width: 10)]),
          Slider(value: _energy, min: 0, max: 10, divisions: 10, label: _energy.round().toString(), onChanged: (v) => setState(() => _energy = v)),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () async { await api.postMood(_mood, _energy.round()); ref.refresh(todayMoodProvider); }, child: const Text('Log Mood')),
          const SizedBox(height: 20),
          Expanded(child: todayAsync.when(
            data: (d) { if (d == null) return const Center(child: Text('No mood logged today'));
              return Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Today\'s mood: ${d['mood']}', style: const TextStyle(fontSize: 18)), const SizedBox(height: 8), Text('Energy: ${d['energy']}'), const SizedBox(height: 8), Text('Logged at: ${d['timestamp']}')])));
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e,s) => Text('Error: $e'),
          ))
        ]),
      ),
    );
  }

  Widget _emojiButton(String emoji) {
    final selected = emoji == _mood;
    return GestureDetector(
      onTap: () => setState(() => _mood = emoji),
      child: CircleAvatar(radius: selected ? 28 : 24, backgroundColor: selected ? AppColors.primary : Colors.white, child: Text(emoji, style: TextStyle(fontSize: selected ? 22 : 20))),
    );
  }
}