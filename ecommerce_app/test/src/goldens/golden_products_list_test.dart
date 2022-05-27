import 'package:ecommerce_app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../robot.dart';

void main() {
  testWidgets('Golden - products list', (tester) async {
    final r = Robot(tester);
    await r.golden.loadRobotoFont();
    await r.golden.loadMaterialIconFont();
    await r.pumpMyApp();
    await r.golden.precacheImages();
    await expectLater(
      find.byType(MyApp),
      matchesGoldenFile(
        'products_list.png',
      ),
    );
  });
}
