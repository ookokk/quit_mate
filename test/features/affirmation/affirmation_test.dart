void main() {
  // All tests passed!
  test('GetRandomAffirmation returns a non-null affirmation', () {
    final affirmationGenerator = GetRandomAffirmation();
    final affirmation = affirmationGenerator.getRandomAffirmation();

    expect(affirmation, isNotNull);
  });
}
