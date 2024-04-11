import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../cleanboot.dart';

/// {@template FilterPage}
/// Select filters to apply to a data-set
/// {@endtemplate}
class FilterPage extends StatefulWidget {
  /// {@macro Widget.PageName}
  static const name = 'filterPage';

  /// {@macro Widget.PagePath}
  static const path = 'filter-page';

  /// {@macro Widget.ViewModel}
  final FilterPageViewModel viewModel;

  /// {@macro Widget.Controller}
  final FilterPageController controller;

  /// Custom scroll controller for content
  ///
  /// [FilterPage] is commonly found in [DraggableScrollableSheet] parents
  /// so providing a [scrollController] allows the content to slide the parent
  /// up to the max height before scrolling its contents
  final ScrollController? scrollController;

  /// {@macro FilterPage}
  const FilterPage({
    required this.viewModel,
    required this.controller,
    this.scrollController,
    super.key,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    unawaited(widget.controller.init());
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.viewModel.background ??
            Theme.of(context).colorScheme.background,
      ),
      child: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel.filters,
          builder: (final context, final _) {
            final slivers = <Widget>[
              SliverAppBar(
                pinned: true,
                title: widget.viewModel.filterPageTitle != null
                    ? Text(
                        widget.viewModel.filterPageTitle!,
                        style: widget.viewModel.filterPageTitleStyle,
                      )
                    : null,
                actions: [
                  IconButton(
                    onPressed: () => widget.controller.clearFilters(),
                    icon: const Icon(
                      Icons.delete_forever,
                    ),
                  ),
                ],
              ),
            ];
            widget.viewModel.filters.value
                .map(_buildFilterSection)
                .toList()
                .forEach(slivers.addAll);

            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    controller: widget.scrollController,
                    slivers: slivers,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16.0,
                    8.0,
                    16.0,
                    4.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (final states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (final states) => const BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            backgroundColor: MaterialStateColor.resolveWith(
                              (final states) =>
                                  widget.viewModel.applyFilterBackground ??
                                  Colors.black87,
                            ),
                            foregroundColor: MaterialStateColor.resolveWith(
                              (final states) =>
                                  widget.viewModel.applyFilterStyle?.color ??
                                  Colors.grey.shade100,
                            ),
                          ),
                          onPressed: () =>
                              widget.controller.dismissPage(context),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              widget.viewModel.applyFilterText ??
                                  'Apply Filters',
                              style: widget.viewModel.applyFilterStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildFilterSection(final FilterSection section) {
    return [
      SliverAppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          section.displayText,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        leading: const SizedBox(),
        backgroundColor:
            widget.viewModel.sectionHeaderBackground ?? Colors.transparent,
        elevation: 0.0,
      ),
      ListenableBuilder(
        listenable: widget.viewModel,
        builder: (final context, _) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: switch (FilterItemDisplayFormat.fromString(
                  section.itemDisplayFormat)) {
                FilterItemDisplayFormat.filterChip =>
                  _buildFilterChips(section),
                FilterItemDisplayFormat.textField =>
                  _buildAutoCompleteTextField(section),
              },
            ),
          );
        },
      ),
    ];
  }

  Widget _buildFilterChips(final FilterSection section) => Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: section.filterItems
            .map(
              (final e) => FilterInputWidget(
                itemDisplayText: e.displayText,
                selected: widget.controller.containsFilter(section, e),
                onSelect: ({
                  required final bool selected,
                }) =>
                    widget.controller.addFilter(
                  section,
                  e,
                  selected: selected,
                ),
              ),
            )
            .toList(),
      );

  Widget _buildAutoCompleteTextField(final FilterSection filterSection) {
    TextEditingController? controller;
    final ac = Autocomplete<FilterItem>(
      displayStringForOption: (final option) => option.displayText,
      fieldViewBuilder: (
        final BuildContext context,
        final TextEditingController textEditingController,
        final FocusNode focusNode,
        final VoidCallback onFieldSubmitted,
      ) {
        controller = textEditingController;
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (final String? text) => onFieldSubmitted(),
        );
      },
      optionsBuilder: (final TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const [];
        }
        final List<FilterItem> matches = [];
        try {
          matches.addAll(
            widget.viewModel.filters.value
                .firstWhere((final section) {
                  return section.identifier == filterSection.identifier;
                })
                .filterItems
                .where(
                  (final FilterItem element) =>
                      element.value is String &&
                      (element.value as String)
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()),
                )
                .toList(),
          );
        } catch (e) {
          debugPrint(e.toString());
        }
        return matches;
      },
      onSelected: (final FilterItem selection) {
        widget.controller.addFilter(
          filterSection,
          selection,
          selected: true,
        );
        controller?.text = '';
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionSelectedOptions(filterSection),
        ac,
      ],
    );
  }

  Widget _buildSectionSelectedOptions(final FilterSection section) {
    final items = widget.viewModel.selectedFilters.value
        .where((final element) => element.identifier == section.identifier)
        .firstOrNull
        ?.filterItems;

    // only add padding if there are selected filters to display
    return Padding(
      padding: EdgeInsets.only(
        bottom: items?.isNotEmpty ?? false ? 8.0 : 0,
      ),
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: items
                ?.map(
                  (final e) => FilterInputWidget(
                    itemDisplayText: e.displayText,
                    onSelect: ({required final selected}) =>
                        widget.controller.addFilter(section, e),
                    selected: true,
                  ),
                )
                .toList() ??
            [
              const SizedBox(),
            ],
      ),
    );
  }
}
