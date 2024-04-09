import '../entities/filter_section.dart';

/// Provides access to filters
abstract class FilterRepository {
  /// Get filter sections and filter items for a category (e.g. cars)
  Future<List<FilterSection>> filters();
}