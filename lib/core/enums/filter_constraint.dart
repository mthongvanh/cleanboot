// ignore_for_file: public_member_api_docs

/// Returns a constraint type, e.g. equal to or less than
enum FilterConstraint {
  equalTo('equalTo'),
  notEqualTo('notEqualTo'),
  lessThan('lessThan'),
  lessThanOrEqualTo('lessThanOrEqualTo'),
  greaterThan('greaterThan'),
  greaterThanOrEqualTo('greaterThanOrEqualTo'),
  arrayContains('arrayContains'),
  arrayContainsAny('arrayContainsAny'),
  whereIn('whereIn'),
  whereNotIn('whereNotIn'),
  isNull('isNull'),
  ;

  /// [FilterConstraint] raw value
  final String value;

  /// Returns a constraint type, e.g. equal to or less than
  const FilterConstraint(this.value);
}
