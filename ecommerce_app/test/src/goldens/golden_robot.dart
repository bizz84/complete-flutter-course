// ignore: depend_on_referenced_packages
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:platform/platform.dart';

/// Helper class with some helper methods for golden image tests
class GoldenRobot {
  GoldenRobot(this.tester);
  final WidgetTester tester;

  /// Loads the cached material icon font.
  /// Only necessary for golden tests. Relies on the tool updating cached assets
  /// before running tests. More info here:
  /// https://stackoverflow.com/questions/65191069/golden-tests-with-custom-icon-font-class
  Future<void> loadMaterialIconFont() async {
    const fs = LocalFileSystem();
    const platform = LocalPlatform();
    final flutterRoot = fs.directory(platform.environment['FLUTTER_ROOT']);

    final iconFont = flutterRoot.childFile(
      fs.path.join(
        'bin',
        'cache',
        'artifacts',
        'material_fonts',
        'MaterialIcons-Regular.otf',
      ),
    );

    final bytes =
        Future<ByteData>.value(iconFont.readAsBytesSync().buffer.asByteData());

    final fontLoader = FontLoader('MaterialIcons')..addFont(bytes);
    await fontLoader.load();
  }

  /// Load Roboto font from the assets
  Future<void> loadRobotoFont() async {
    final font = rootBundle.load('assets/fonts/Roboto-Regular.ttf');

    final fontLoader = FontLoader('Roboto')..addFont(font);
    await fontLoader.load();
  }

  /// Precache images for all widgets of type [Image]
  Future<void> precacheImages() async {
    final finder = find.byType(Image);
    final matches = finder.evaluate();
    if (matches.isNotEmpty) {
      await tester.runAsync(() async {
        for (var match in matches) {
          final image = match.widget as Image;
          await precacheImage(image.image, match);
        }
      });
    }
    await tester.pumpAndSettle();
  }

  /// Sets the surface size.
  /// Useful for generating golden image tests of different sizes
  Future<void> setSurfaceSize(Size size) async {
    await tester.binding.setSurfaceSize(size);
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
  }
}
