class BasePropertyParams<T> {
  final String id;
  final String title;
  final T? initialValue;
  final T defaultValue;
  final bool isOptional;

  BasePropertyParams({
    required this.id,
    required this.title,
    required this.defaultValue,
    this.isOptional = true,
    T? initialValue,
  }) : initialValue = isOptional ? initialValue : initialValue ?? defaultValue;
}
