import 'package:flutter/material.dart';

import '../../../../core/widgets/comman_app_bar.dart';
import '../../data/models/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Health Coach'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: HomeItems.all.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = HomeItems.all[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                );
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  color: item.color.withAlpha(40),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: item.color,
                      child: Icon(
                        item.icon,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
