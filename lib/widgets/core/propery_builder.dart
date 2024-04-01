// import 'package:flutter/material.dart';
// import 'package:flutter_quest_architecture/core/property_identifier.dart';
// import 'package:flutter_quest_architecture/core/property_provider.dart';
// import 'package:flutter_quest_architecture/widgets/core/editor.dart';
// import 'package:provider/provider.dart';
//
// class PropertyExplorerBuilder<T> extends StatefulWidget {
//   final String widgetName;
//   final ({Widget widget, String code}) Function(
//       PropertiesNotifier<T> configurations) builder;
//
//   const PropertyExplorerBuilder({
//     super.key,
//     required this.widgetName,
//     required this.builder,
//   });
//
//   @override
//   State<PropertyExplorerBuilder<T>> createState() =>
//       _PropertyExplorerBuilderState<T>();
// }
//
// class _PropertyExplorerBuilderState<T>
//     extends State<PropertyExplorerBuilder<T>> {
//
//   @override
//   Widget build(BuildContext context) {
//     toWidget(PropertyIdentifier e) => e.widget;
//     return ChangeNotifierProvider(
//       create: (_) => PropertiesNotifier<T>(),
//       child: Consumer<PropertiesNotifier<T>>(
//         builder: (_, props, __) {
//           final result = widget.builder.call(props);
//
//           return WidgetEditor(
//             title: widget.widgetName,
//             properties: props.properties.map(toWidget).toList(),
//             widget: result.widget,
//             code: result.code,
//           );
//         },
//       ),
//     );
//   }
// }
