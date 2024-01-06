import 'package:flutter_test/flutter_test.dart';
import 'package:quit_mate/src/feature/navigation/features/affirmation/model/get_random_affirmation.dart';

void main() {
  // All tests passed!
  test('GetRandomAffirmation returns a non-null affirmation', () {
    final affirmationGenerator = GetRandomAffirmation();
    final affirmation = affirmationGenerator.getRandomAffirmation();

    expect(affirmation, isNotNull);
  });
}
