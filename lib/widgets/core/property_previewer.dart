import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/animated_card.dart';
import 'package:flutter_quest_architecture/widgets/core/property.dart';

class PropertyPreviewer<U> extends StatefulWidget {
  final List<U> values;
  final PropertyWidget<U> Function(void Function(U), U) propertyBuilder;
  final String Function(U)? valueTitleBuilder;
  final String title;

  const PropertyPreviewer({
    super.key,
    required this.values,
    required this.propertyBuilder,
    required this.title,
    this.valueTitleBuilder,
  }) : assert(values.length > 0, 'Values cannot be empty');

  @override
  State<PropertyPreviewer<U>> createState() => _PropertyPreviewerState<U>();
}

class _PropertyPreviewerState<U> extends State<PropertyPreviewer<U>> {
  int _currentIndex = 0;
  U? _value;

  U get value => this._value ?? widget.values[_currentIndex];

  @override
  Widget build(BuildContext context) {
    final title = widget.valueTitleBuilder?.call(value) ?? value.toString();

    final widgetTitle = Text(
      widget.title,
      style: context.textTheme.titleLarge
          ?.copyWith(color: context.colorScheme.onSurface),
    );

    final prevIterateIconButton = _IterateIconButton(
      onPressed: _prevValue,
      icon: Icons.arrow_left,
    );
    final nextIterateIconButton = _IterateIconButton(
      onPressed: _nextValue,
      icon: Icons.arrow_right,
    );

    final valueTitle = Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        color: context.colorScheme.onTertiaryContainer,
      ),
    );

    final valueBar = Container(
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(35),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          prevIterateIconButton,
          Expanded(
            child: Center(
              child: valueTitle,
            ),
          ),
          nextIterateIconButton,
        ],
      ),
    );
    return AnimatedCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widgetTitle,
              valueBar,
              widget.propertyBuilder(
                onChanged,
                value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _nextValue() {
    setState(() {
      _value = null;
      _currentIndex =
          _currentIndex == widget.values.length - 1 ? 0 : _currentIndex + 1;
    });
  }

  void _prevValue() {
    setState(() {
      _value = null;
      _currentIndex =
          _currentIndex == 0 ? widget.values.length - 1 : _currentIndex - 1;
    });
  }

  void onChanged(U val) {
    setState(() {
      _value = val;
      if (widget.values.contains(val)) {
        _currentIndex = widget.values.indexOf(val);
        _value = null;
      }
    });
  }
}

class _IterateIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const _IterateIconButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: context.colorScheme.onTertiaryContainer,
      ),
    );
  }
}
