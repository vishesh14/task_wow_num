import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/comman_app_bar.dart';
import '../provider/chat_provider.dart';

class AiCoachScreen extends ConsumerStatefulWidget {
  const AiCoachScreen({super.key});

  @override
  ConsumerState<AiCoachScreen> createState() => _AiCoachScreenState();
}

class _AiCoachScreenState extends ConsumerState<AiCoachScreen> {
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) _scroll.jumpTo(_scroll.position.maxScrollExtent);
    });

    return Scaffold(
      appBar: const CommonAppBar(title: 'AI Coach'),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            controller: _scroll,
            itemCount: messages.length,
            itemBuilder: (context, i) {
              final m = messages[i];
              return Align(
                alignment: m.isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  decoration: BoxDecoration(
                    color: m.isUser ? Theme.of(context).primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)],
                  ),
                  child: Text(m.text, style: TextStyle(color: m.isUser ? Colors.white : Colors.black87)),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Expanded(child: TextField(controller: _ctrl, decoration: const InputDecoration(hintText: 'Message'))),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                final t = _ctrl.text.trim();
                if (t.isEmpty) return;
                notifier.sendUser(t);
                _ctrl.clear();
              },
              child: const Text('Send'),
            )
          ]),
        )
      ]),
    );
  }
}