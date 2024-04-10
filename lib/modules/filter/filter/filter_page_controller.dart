import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../cleanboot.dart';
import '../domain/use_cases/get_filters_use_case.dart';
import 'filter_page.dart';
import 'filter_page_view_model.dart';

/// Controls values on a view model to update widgets
class FilterPageController extends Controller<FilterPage> {
  /// Holds values for [FilterPage] widgets
  final FilterPageViewModel _viewModel;

  /// Get filter options
  final GetFiltersUseCase getFiltersUseCase;

  /// Creates a new instance of [FilterPageController]
  FilterPageController(
    this._viewModel,
    super.navigator, {
    required this.getFiltersUseCase,
  });

  /// Perform some initialization steps
  @override
  Future<void> init() async {
    await _getFilters();
    return;
  }

  Future<void> _getFilters() async {
    final response = await getFiltersUseCase.execute(NoParams());
    if (response.result != null) {
      viewModel.filters.value = response.result!;
    } else {
      _onError(response.failure?.description);
    }
  }

  void _onError([final String? message]) {
    debugPrint(message ?? 'Error message was empty');
  }

  /// Adds a filter item to the selectedFilters
  void addFilter(
    final FilterSection selectedSection,
    final FilterItem selectedFilter, {
    final bool selected = false,
  }) {
    selectedFilter.selected = !selectedFilter.selected;
    viewModel.update();
  }

  /// Pop the current page and return any selected filters
  void dismissPage(final BuildContext context) {
    final sections = <FilterSection>[];
    for (final section in viewModel.filters.value) {
      sections.add(
        FilterSection(
          identifier: section.identifier,
          displayText: section.displayText,
          filterItems: section.filterItems
              .where(
                (final FilterItem element) => element.selected,
              )
              .toList(),
        ),
      );
    }
    Navigator.of(context).pop(sections);
  }

  @override
  FilterPageViewModel get viewModel => _viewModel;
}
