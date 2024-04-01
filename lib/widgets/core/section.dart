import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Widget> properties;

  const Section({super.key, required this.title, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title),
        ...properties.map(
          (e) => Padding(
            padding: const EdgeInsets.only(left: 16),
            child: e,
          ),
        )
      ],
    );
  }
}
