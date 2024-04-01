// import 'package:flutter/cupertino.dart';
// import 'package:flutter_quest_architecture/property_fields/color_field.dart';
// import 'package:flutter_quest_architecture/widgets/core/section_builder.dart';
//
// class DecorationSection extends StatelessWidget {
//   final void Function(BoxDecoration) onChanged;
//   final BoxDecoration value;
//
//   const DecorationSection({
//     super.key,
//     required this.onChanged,
//     required this.value,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SectionBuilder(
//       widgetName: 'Decoration',
//       builder: (configurations) {
//         final color = configurations.colorField(id: 'color', title: 'Color',);
//         onChanged(
//           value.copyWith(
//             color: color,
//           ),
//         );
//       },
//     );
//   }
// }
