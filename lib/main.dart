import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/explorer_page.dart';
import 'package:flutter_quest_architecture/catalog/widgets.providers.g.dart';
import 'package:provider/provider.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'catalog/home.dart';
import 'widgets/reactive_grid.dart';

void main() async {
  runApp(const MyApp());
}

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);
final ValueNotifier<Color> themeColorNotifier =
    ValueNotifier(const Color(0xFF00B8D4));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    test();
    return MultiProvider(
      providers: getProviders(),
      builder: (_, __) => ValueListenableBuilder<Color>(
        valueListenable: themeColorNotifier,
        builder: (_, color, __) {
          return ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (_, mode, __) {
              return MaterialApp(
                title: 'Flutter Quest',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: color,
                    brightness: Brightness.light,
                  ),
                  sliderTheme: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                ),
                darkTheme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: color,
                    brightness: Brightness.dark,
                  ),
                  sliderTheme: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                ),
                themeMode: mode,
                home: const Home(), //_initialScreen.widget,
              );
            },
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String image1 =
//       'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&auto=format&fit=crop&w=1866&q=80';
//   String image2 =
//       'https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1860&q=80';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SizedBox(
//               height: 300,
//               width: 200,
//               child: TiltWidget(
//                 image: image1,
//                 text: 'Cliffs of Cinque',
//                 subText: 'Manarola, Italy',
//               ),
//             ),
//             // TiltWidget(
//             //   image: image2,
//             //   text: 'Rialto Bridge',
//             //   subText: 'Venezia, Italy',
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

typedef Size = ({int height, int width});

({int height, int width}) getSize() {
  return (height: 100, width: 200);
}

void draw(({int height, int width}) size) {

}
void test() {
  print("test");
  final ({int height, int width}) result = getSize();
  draw(result);
  print("(${result.height},${result.width})");
}
