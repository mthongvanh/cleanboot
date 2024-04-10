import '../../../cleanboot.dart';

class FilterFailure extends Failure {
  const FilterFailure({
    super.description = 'Failed to load filters',
    super.reason = 'Failed to load filters for an unknown reason',
    super.code = 13000,
  });
}
