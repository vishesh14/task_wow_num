import 'package:flutter_riverpod/flutter_riverpod.dart';

class Message {
  final String text;
  final bool isUser;
  Message({required this.text, required this.isUser});
}

final chatProvider = StateNotifierProvider<ChatNotifier, List<Message>>((ref) => ChatNotifier());

class ChatNotifier extends StateNotifier<List<Message>> {
  ChatNotifier() : super([
    Message(text: 'Hi! I\'m your coach. Ask me anything about logging or nutrition.', isUser: false)
  ]);

  void sendUser(String text) {
    state = [...state, Message(text: text, isUser: true)];
    // simulate async reply
    Future.delayed(const Duration(milliseconds: 900), () {
      final reply = _generateReply(text);
      state = [...state, Message(text: reply, isUser: false)];
    });
  }

  String _generateReply(String userText) {
    final l = userText.toLowerCase();
    if (l.contains('calorie') || l.contains('calories')) return 'Try to keep meals balanced. If your daily target is 1800 kcal, aim for ~600 kcal per meal.';
    if (l.contains('streak')) return 'Nice! Keep a daily small action — even 1-minute walk counts. Consistency > intensity.';
    return 'That\'s interesting. Tell me more or ask how to log this.';
  }
}