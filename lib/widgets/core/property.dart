import 'package:flutter/material.dart';

abstract class PropertyWidget<T> extends StatelessWidget {
  final void Function(T) onChanged;
  final T value;

  const PropertyWidget({
    super.key,
    required this.onChanged,
    required this.value,
  });
}

abstract class PropertyStatefulWidget<T> extends StatefulWidget {
  final void Function(T) onChanged;
  final T value;

  const PropertyStatefulWidget({
    super.key,
    required this.onChanged,
    required this.value,
  });
}
