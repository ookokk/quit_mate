enum ProjectRadius {
  /// 8.
  small(6),

  /// 16.
  medium(12),

  /// 20.
  normal(18),

  /// 32.
  large(25);

  final double value;
  const ProjectRadius(this.value);
}
