import 'dart:ui';

import 'package:ecommerce_app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../robot.dart';

void main() {
  final sizeVariant = ValueVariant<Size>({
    const Size(300, 600),
    const Size(600, 800),
    const Size(1000, 1000),
  });
  testWidgets(
    'Golden - products list',
    (tester) async {
      final r = Robot(tester);
      final currentSize = sizeVariant.currentValue!;
      await r.golden.setSurfaceSize(currentSize);
      await r.golden.loadRobotoFont();
      await r.golden.loadMaterialIconFont();
      await r.pumpMyApp();
      await r.golden.precacheImages();
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile(
          'products_list_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png',
        ),
      );
    },
    variant: sizeVariant,
    tags: ['golden'],
    // Skip this test until we can run it successfully on CI without this error:
    // Golden "products_list_300x600.png": Pixel test failed, 2.33% diff detected.
    skip: true,
  );
}
