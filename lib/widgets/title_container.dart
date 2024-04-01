import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

class TitleContainer extends StatelessWidget {
  final String title;

  const TitleContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Center(
          child: Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
