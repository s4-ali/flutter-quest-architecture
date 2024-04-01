import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/core/logger.dart';
import 'package:flutter_quest_architecture/core/property_params.dart';

class FieldTitle extends StatefulWidget {
  final BasePropertyParams params;
  final Widget? child;
  final void Function(dynamic) onChanged;
  final bool inline;

  const FieldTitle({
    super.key,
    required this.params,
    this.child,
    required this.onChanged,
    this.inline = false,
  });

  @override
  State<FieldTitle> createState() => _FieldTitleState();
}

class _FieldTitleState extends State<FieldTitle> {
  late bool expanded;
  final controller = ExpansionTileController();

  @override
  void initState() {
    expanded = widget.child != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log.i("expanded: $expanded");
    if (widget.params.isOptional) {
      return ExpansionTile(
        title: Text(widget.params.title),
        onExpansionChanged: onExpansionChanged,
        controller: controller,
        initiallyExpanded: expanded,
        trailing: widget.params.isOptional
            ? AnimatedRotation(
                turns: expanded ? 315 / 360 : 0,
                duration: const Duration(milliseconds: 350),
                child: const Icon(Icons.add),
              )
            : const SizedBox.shrink(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: widget.child,
          ),
        ],
      );
    }
    return Column(
      children: [
        ListTile(
          title: Text(widget.params.title),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: widget.child,
        ),
      ],
    );
  }

  void onExpansionChanged(expanded) {
    if (expanded) {
      widget.onChanged(widget.params.defaultValue!);
    } else {
      widget.onChanged(null);
    }
    setState(() {
      this.expanded = expanded;
    });
  }
}
