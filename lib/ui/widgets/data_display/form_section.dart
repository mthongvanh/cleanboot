

import 'package:flutter/material.dart';

/// {@template FormSection}
/// Creates a widget with a title, description, and form content
/// {@endtemplate}
class FormSection extends StatelessWidget {
  /// Title text form the form section
  final String title;

  /// Additional information about the form content, e.g. explanation or
  /// clarifying requirements
  final String description;

  /// Padding around the form section description
  final EdgeInsets descriptionPadding;

  /// Child widget that contains a form field widget
  final Widget formContent;

  /// Controls form's root column main axis alignment
  final CrossAxisAlignment contentAlignment;

  /// {@macro FormSection}
  const FormSection({
    required this.title,
    required this.description,
    required this.formContent,
    this.contentAlignment = CrossAxisAlignment.start,
    this.descriptionPadding = const EdgeInsets.only(bottom: 12.0, top: 8.0),
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: contentAlignment,
      children: [
        _buildTitle(
          context,
          title,
        ),
        _buildSectionDescription(
          context,
          description,
        ),
        formContent,
      ],
    );
  }

  Widget _buildTitle(
      final BuildContext context,
      final String sectionTitleText,
      ) {
    return Text(
      sectionTitleText,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  Padding _buildSectionDescription(
      final BuildContext context,
      final String sectionDescriptionText,
      ) {
    return Padding(
      padding: descriptionPadding,
      child: Text(
        sectionDescriptionText,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
    );
  }
}