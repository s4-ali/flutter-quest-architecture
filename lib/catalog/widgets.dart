import 'package:flutter/material.dart';
import 'package:generator/generator.dart';

const widgets = {
  Divider: "A thin horizontal line, with padding on either side.",
  SizedBox: "If given a child, this widget forces it to have a specific width and/or height. These values will be ignored if this widget's parent does not permit them.",
};

@WidgetsAnnotation(widgets: widgets)
class Widgets{}