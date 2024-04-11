import 'package:cleanboot/cleanboot.dart';
import 'package:flutter/material.dart';

import 'filter_page.dart';

/// Provides values to display on the [FilterPage]
class FilterPageViewModel extends ViewModel<FilterPage> {
  /// All available filters
  final filters = ValueNotifier<List<FilterSection>>([]);

  /// filter page header text
  final String? filterPageTitle;

  /// Text appearance customization for filter page header text
  final TextStyle? filterPageTitleStyle;

  /// Text appearance customization for filter section header text
  final TextStyle? filterSectionHeaderStyle;

  /// Background color for each filter section's header
  final Color? sectionHeaderBackground;

  /// Background color for the page
  final Color? background;

  /// Background color for apply filter button
  final Color? applyFilterBackground;

  /// Text displayed on the apply filter button
  final String? applyFilterText;

  /// Appearance customization for the apply filter button
  final TextStyle? applyFilterStyle;

  final selectedFilters = ValueNotifier<List<FilterSection>>([]);

  /// Provides values to display on the [FilterPage]
  FilterPageViewModel({
    this.background,
    this.filterPageTitle,
    this.filterPageTitleStyle,
    this.sectionHeaderBackground,
    this.filterSectionHeaderStyle,
    this.applyFilterBackground,
    this.applyFilterText,
    this.applyFilterStyle,
  });
}
