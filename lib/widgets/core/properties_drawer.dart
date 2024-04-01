import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/widgets/title_container.dart';

class PropertiesDrawer extends StatelessWidget {
  final String title;
  final List<Widget> properties;
  const PropertiesDrawer({
    super.key,
    required this.title,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            TitleContainer(title: "$title Properties"),
            const SizedBox(height: 16,),
            Expanded(
              child: ListView(
                children: [
                  ...properties.map(
                        (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: e,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
