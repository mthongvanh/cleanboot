import '../../../../cleanboot.dart';

/// Provides access to locally stored filter data
abstract class FilterLocalDataSource {
  /// Get filter sections
  Future<List<FilterSectionModel>> filterSections();
}