import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_quest_architecture/core/explorable_widget.dart';
import 'package:flutter_quest_architecture/core/property_params.dart';

import '../widgets/field_title.dart';
import 'property_identifier.dart';

/// Holds the currently active properties notifier
class ActiveWidgetNotifier extends ChangeNotifier {
  ExplorableWidget _widget;
  ExplorableWidget get explorable => _widget;

  ActiveWidgetNotifier(this._widget);

  void update({required ExplorableWidget explorable}){
    _widget = explorable;
    notifyListeners();
  }
}

/// Holds a list of properties of an [ExplorableWidget] and
/// the values against those properties.
abstract class PropertiesNotifier<T> extends ChangeNotifier
    with DiagnosticableTreeMixin {

  T get fieldValues;
  String get code;
  PropertiesNotifier(){
    registerFields();
  }
  /// List of property widgets
  final List<PropertyIdentifier> properties = [];

  /// Values of each property
  final Map<String, dynamic> _values = {};

  void updateProperty(PropertyIdentifier widget) {
    properties.update(widget);
  }

  void setValueOf(String id, dynamic value) {
    _values[id] = value;
    notifyListeners();
  }

  dynamic getValueOf(String id, [dynamic initial]) {
    if (_values[id] == null) {
      _values[id] = initial;
    }
    return _values[id];
  }

  void setInitialValue(String id, value) {
    if (_values.keys.contains(id)) return;
    _values[id] = value;
  }

  Widget buildPreview(BuildContext context);

  void registerFields();

  /// called when field is closed or opened
  void onFieldUpdated(){
    notifyListeners();
  }
}

class BuildResult<T> extends ChangeNotifier with DiagnosticableTreeMixin{
  Widget _widget = const SizedBox.shrink();
  String _code = "";

  Widget get widget => _widget;

  String get code => _code;

  void update({
    required Widget widget,
    required String code,
  }) {
    this._widget = widget;
    this._code = code;
  }
}

abstract class PropertyField<T extends BasePropertyParams, U> {
  final PropertiesNotifier _props;
  final T params;

  bool get inline => false;

  PropertyField(this._props, this.params);

  Widget build(T params, Function(U) onChanged, U value);

  void register() {
    _props.setInitialValue(params.id, params.initialValue);

    if (_props.properties.alreadyExists(params.id)) {
      return;
    }

    PropertyIdentifier buildPropertyField(Function(U?) onChanged) {
      final value = _props.getValueOf(
          params.id, params.isOptional ? null : params.initialValue);
      return PropertyIdentifier<U>(
        id: params.id,
        widget: FieldTitle(
          params: params,
          onChanged: (val) => onChanged(val as U?),
          inline: inline,
          child: value == null
              ? null
              : build(
                  params,
                  onChanged,
                  value!,
                ),
        ),
      );
    }

    void onValueUpdated(U? newValue) {
      _props.setValueOf(params.id, newValue);
      _props.updateProperty(buildPropertyField(onValueUpdated));
    }

    _props.properties.add(buildPropertyField(onValueUpdated));
  }
}
