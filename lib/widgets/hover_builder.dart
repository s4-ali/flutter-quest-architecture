import 'package:flutter/material.dart';

class HoverBuilder<T> extends StatefulWidget {
  final T Function(bool) value;
  final Widget Function(T) builder;

  const HoverBuilder({
    super.key,
    required this.value,
    required this.builder,
  });

  @override
  State<HoverBuilder<T>> createState() => _HoverBuilderState<T>();
}

class _HoverBuilderState<T> extends State<HoverBuilder<T>> {
  late T value;

  @override
  void initState() {
    value = widget.value(false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_){
        setState(() {
          value = widget.value(true);
        });
      },
      onExit:  (_){
        setState(() {
          value = widget.value(false);
        });
      },
      child: widget.builder(value),
    );
  }
}
