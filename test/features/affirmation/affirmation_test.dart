import 'package:flutter_test/flutter_test.dart';
import 'package:quit_mate/src/feature/affirmation/model/get_random_affirmation.dart';

void main() {
  //Passed Successfully
  group('GetRandomAffirmation', () {
    test('getRandomAffirmation should return a non-null affirmation', () {
      final getRandomAffirmation = GetRandomAffirmation();
      final affirmation = getRandomAffirmation.getRandomAffirmation();

      expect(affirmation, isNotNull);
      expect(affirmation, isNotEmpty);
    });
  });
}
