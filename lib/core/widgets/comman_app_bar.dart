import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor:  theme.primaryColor,
      title: Text(
        title,
        style: theme.appBarTheme.titleTextStyle ??
            TextStyle(
              color: theme.appBarTheme.foregroundColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
      ),
      iconTheme: theme.appBarTheme.iconTheme ??
          IconThemeData(
            color: theme.appBarTheme.foregroundColor ?? Colors.white,
          ),
      actions: actions,
    );
  }
}
