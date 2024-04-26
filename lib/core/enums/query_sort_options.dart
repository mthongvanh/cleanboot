/// Parameters used to sort fetch query results
class SortOptions {
  /// Field name on which to sort
  final String field;

  /// Whether to sort ascending or descending
  final bool ascending;

  /// Parameters used to sort fetch query results
  const SortOptions(
      this.field, {
        this.ascending = false,
      });
}