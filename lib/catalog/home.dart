import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_quest_architecture/catalog/explorer_page.dart';
import 'package:flutter_quest_architecture/catalog/widgets.providers.g.dart';
import 'package:flutter_quest_architecture/core/explorable_widget.dart';
import 'package:flutter_quest_architecture/core/logger.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/canvas_background.dart';
import 'package:flutter_quest_architecture/widgets/expandable_menu.dart';
import 'package:flutter_quest_architecture/widgets/explore_widget_card.dart';
import 'package:flutter_quest_architecture/widgets/switch_theme_icon_button.dart';
import 'package:flutter_quest_architecture/widgets/theme_colors.dart';
import 'package:flutter_quest_architecture/widgets/title_container.dart';
import 'package:flutter_quest_architecture/widgets/title_container_with_theme.dart';
import 'package:provider/provider.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widgetsList = explorableWidgets.values.toList();
    const itemCount = 2;
    return Scaffold(
      body: Column(
        children: [
          const TitleContainerWithTheme(title: "Explore Widgets"),
          // ElevatedButton(
          //   onPressed: () async {
          //     await UnityAds.init(
          //       gameId: '5544144',
          //       onComplete: () async {
          //         log.i('Ads: Initialization Complete');
          //         await UnityAds.load(
          //           placementId: 'Rewarded_Android',
          //           onComplete: (placementId) async {
          //             log.i('Ads: Load Complete $placementId');
          //             await UnityAds.showVideoAd(
          //               placementId: 'Rewarded_Android',
          //               onStart: (placementId) =>
          //                   log.i('Ads: Video Ad $placementId started'),
          //               onClick: (placementId) =>
          //                   log.i('Ads: Video Ad $placementId click'),
          //               onSkipped: (placementId) =>
          //                   log.i('Ads: Video Ad $placementId skipped'),
          //               onComplete: (placementId) =>
          //                   log.i('Ads: Video Ad $placementId completed'),
          //               onFailed: (placementId, error, message) => log.i(
          //                   'Ads: Video Ad $placementId failed: $error $message'),
          //             );
          //           },
          //           onFailed: (placementId, error, message) =>
          //               log.i('Ads: Load Failed $placementId: $error $message'),
          //         );
          //       },
          //       onFailed: (error, message) =>
          //           log.i('Ads: Initialization Failed: $error $message'),
          //     );
          //   },
          //   child: const Text("Action"),
          // ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < itemCount; i++)
                        ExploreWidgetCard(widget: widgetsList[i % 2])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future showVideoAd(
    String placementId,
    Future Function()? onComplete,
    Future Function()? onFailed,
  ) async {
    await UnityAds.init(
      gameId: '5544144',
      onComplete: () async {
        await UnityAds.load(
          placementId: placementId,
          onComplete: (placementId) async {
            await UnityAds.showVideoAd(
              placementId: placementId,
              onSkipped: (placementId) => onFailed?.call(),
              onComplete: (placementId) => onComplete?.call(),
              onFailed: (placementId, error, message) => onFailed?.call(),
            );
          },
          onFailed: (placementId, error, message) => onFailed?.call(),
        );
      },
      onFailed: (error, message) => onFailed?.call(),
    );
  }
}
