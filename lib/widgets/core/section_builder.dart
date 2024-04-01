// import 'package:flutter/material.dart';
// import 'package:flutter_quest_architecture/core/property_identifier.dart';
// import 'package:flutter_quest_architecture/core/property_provider.dart';
// import 'section.dart' as app;
// class SectionBuilder extends StatefulWidget {
//   final String widgetName;
//   final void Function(PropertiesNotifier configurations) builder;
//
//   const SectionBuilder({
//     super.key,
//     required this.widgetName,
//     required this.builder,
//   });
//
//   @override
//   State<SectionBuilder> createState() => _SectionBuilderState();
// }
//
// class _SectionBuilderState extends State<SectionBuilder> {
//   List<Widget> widgets = [];
//   final PropertiesNotifier configurations = PropertiesNotifier();
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 100), (){
//       widget.builder.call(configurations);
//       setState(() {});
//     });
//     configurations.addListener(_onConfigurationsUpdated);
//   }
//
//   void _onConfigurationsUpdated() {
//     widget.builder.call(configurations);
//     // setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     toWidget(PropertyIdentifier e) => e.widget;
//     return app.Section(
//       title: widget.widgetName,
//       properties: configurations.properties.map(toWidget).toList(),
//     );
//   }
// }
