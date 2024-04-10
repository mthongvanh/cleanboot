/// How to display the options and allow the user to select filters
enum FilterItemDisplayFormat {
  /// Wrapped filter chips
  filterChip('filterChip'),

  /// Text field with dropdown
  textField('textField');

  /// Display format's underlying value
  final String value;

  const FilterItemDisplayFormat(this.value);

  /// Convert a string to [FilterItemDisplayFormat]
  static FilterItemDisplayFormat fromString(final String format) =>
      FilterItemDisplayFormat.values
          .where(
            (final element) =>
        element.value.toLowerCase() == format.toLowerCase(),
      )
          .first;
}