library generator;

import 'package:build/build.dart';
import 'package:generator/src/codes_generator.dart';
import 'package:generator/src/drawers_generator.dart';
import 'package:generator/src/previews_generator.dart';
import 'package:source_gen/source_gen.dart';
export 'src/annotation.dart' show WidgetsAnnotation;
import 'src/provider_generator.dart';

Builder providersGenerator(BuilderOptions options) =>
    LibraryBuilder(ProviderGenerator(), generatedExtension: '.providers.g.dart');

Builder codesGenerator(BuilderOptions options) =>
    LibraryBuilder(CodesGenerator(), generatedExtension: '.codes.g.dart');

Builder previewsGenerator(BuilderOptions options) =>
    LibraryBuilder(PreviewsGenerator(), generatedExtension: '.previews.g.dart');
Builder drawersGenerator(BuilderOptions options) =>
    LibraryBuilder(DrawersGenerator(), generatedExtension: '.drawers.g.dart');
