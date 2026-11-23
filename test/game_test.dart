import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hizli_hesap/oyun_hizli_hesap.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hizliHesapConfig.title.length, 33);
    expect(hizliHesapConfig.tagline.length, 33);
    for (final s in hizliHesapConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hizliHesapConfig.gameId, hizliHesapId);
    expect(hizliHesapRules.gameId, hizliHesapId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hizliHesapRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hizliHesapId, optionalMechanics: hizliHesapRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hizliHesapRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
