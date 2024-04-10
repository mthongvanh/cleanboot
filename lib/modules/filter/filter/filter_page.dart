import 'dart:async';

import 'package:cleanboot/cleanboot.dart';
import 'package:flutter/material.dart';

import 'filter_page_controller.dart';
import 'filter_page_view_model.dart';

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
                title: const Text('Filters'),
                actions: [
                  IconButton(
                    onPressed: () => debugPrint('deselect all'),
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
                  padding: EdgeInsets.fromLTRB(
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
                              (final states) => Colors.black87,
                            ),
                            foregroundColor: MaterialStateColor.resolveWith(
                              (final states) => Colors.grey.shade100,
                            ),
                          ),
                          onPressed: () =>
                              widget.controller.dismissPage(context),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Filter'),
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
              child: Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                children: section.filterItems.map((final e) {
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(splashFactory: NoSplash.splashFactory),
                    child: FilterChip(
                      selected: e.selected,
                      showCheckmark: true,
                      checkmarkColor: Theme.of(context).colorScheme.surface,
                      label: Text(
                        e.displayText,
                      ),
                      labelStyle: TextStyle(
                        color: MaterialStateColor.resolveWith((final states) {
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context).colorScheme.surface;
                          } else {
                            return Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.75);
                          }
                        }),
                      ),
                      selectedColor: Theme.of(context).colorScheme.onSurface,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .surfaceVariant
                          .withOpacity(0.25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      onSelected: (final selected) {
                        widget.controller
                            .addFilter(section, e, selected: selected);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    ];
  }
}
