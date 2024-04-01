import 'package:flutter/widgets.dart';

extension PropertyIdentifierListExtension on List<PropertyIdentifier> {
  void update(PropertyIdentifier property) {
    final widget = firstWhere((element) => element.id == property.id);
    final index = indexOf(widget);
    remove(widget);
    insert(
      index,
      property,
    );
  }

  bool alreadyExists(String id) {
    return where((element) => element.id == id).isNotEmpty;
  }
}

/// Encapsulates the property widget with it's unique id.
class PropertyIdentifier<T> {
  /// This is used to store a value against this property
  final String id;

  /// This is the property widget that will get displayed in properties panel
  final Widget widget;

  const PropertyIdentifier({
    required this.id,
    required this.widget,
  });
}
