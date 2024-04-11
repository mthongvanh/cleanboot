import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../cleanboot.dart';

/// Controls values on a view model to update widgets
class FilterPageController extends Controller<FilterPage> {
  /// Holds values for [FilterPage] widgets
  final FilterPageViewModel _viewModel;

  /// Get filter options
  final GetFiltersUseCase getFiltersUseCase;

  /// Applied filters
  final List<FilterSection>? appliedFilters;

  /// Creates a new instance of [FilterPageController]
  FilterPageController(
    this._viewModel,
    super.navigator, {
    required this.getFiltersUseCase,
    this.appliedFilters,
  });

  /// Perform some initialization steps
  @override
  Future<void> init() async {
    viewModel.selectedFilters.value.addAll(appliedFilters ?? <FilterSection>[]);

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

    final section = viewModel.selectedFilters.value.firstWhere(
          (final element) => element.identifier == selectedSection.identifier,
      orElse: () => FilterSection(
        identifier: selectedSection.identifier,
        filterItems: List.empty(growable: true),
        displayText: selectedSection.displayText,
        itemDisplayFormat: selectedSection.itemDisplayFormat,
        multiSelect: selectedSection.multiSelect,
      ),
    );

    if (!viewModel.selectedFilters.value.contains(section)) {
      viewModel.selectedFilters.value.add(section);
    }

    final bool containsFilter = section.filterItems.contains(selectedFilter);
    if (selected && !containsFilter) {
      // add the filter
      if (!selectedSection.multiSelect) {
        section.filterItems.clear();
      }

      section.filterItems.add(selectedFilter);
    } else {
      // remove the filter
      section.filterItems.remove(selectedFilter);
    }

    viewModel.update();
  }

  /// Whether the filter has been selected
  bool containsFilter(final FilterSection filterSection, final FilterItem filterItem) {
    if (viewModel.selectedFilters.value.any((element) => element.identifier == filterSection.identifier)) {
      final section = viewModel.selectedFilters.value.where((element) => element.identifier == filterSection.identifier).first;
      return section.filterItems.contains(filterItem);
    }
    return false;
  }

  /// Clear any selected filters
  void clearFilters() {
    viewModel.selectedFilters.value.clear();
    viewModel.update();
  }

  /// Pop the current page and return any selected filters
  void dismissPage(final BuildContext context) {
    Navigator.of(context).pop(viewModel.selectedFilters.value);
  }

  @override
  FilterPageViewModel get viewModel => _viewModel;
}
