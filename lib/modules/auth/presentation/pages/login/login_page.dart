import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../cleanboot.dart';

/// {@template Login}
/// {@endtemplate}
class LoginPage extends StatefulWidget {
  /// {@macro Widget.PageName}
  static const name = 'LoginPage';

  /// {@macro Widget.PagePath}
  static const path = '/login';

  /// {@macro Widget.ViewModel}
  final LoginPageViewModel viewModel;

  /// {@macro Widget.Controller}
  final LoginPageController controller;

  /// Header widget below the app bar and above the login form content
  final WidgetBuilder? headerBuilder;

  /// Builds the login form content
  final Widget Function(
    BuildContext context,
    Key formKey,
    TextEditingController identifierEditingController,
    TextEditingController secretEditingController,
  )? contentBuilder;

  /// {@macro Login}
  const LoginPage({
    required this.viewModel,
    required this.controller,
    this.headerBuilder,
    this.contentBuilder,
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();

  /// Presents the login page as a modal
  static Future<void> presentModal(
    final BuildContext context,
    final AppServiceLocator sl,
  ) async {
    final result = await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(0.0),
      builder: (final ctx) => ExpandingDraggableScrollable(
        snap: true,
        maxChildSize: 0.9,
        initialChildSize: 0.9,
        // snapSizes: const [
        //   0.5,
        //   0.85,
        // ],
        shouldCloseOnMinExtent: false,
        builder: (final context, final scrollController) => ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          clipBehavior: Clip.hardEdge,
          child: sl.get<LoginPage>(
            param1: RouteParams(
              customMap: {
                // pass the scroll controller to the [FilterPaintPage] to allow
                // its content to slide the draggable sheet up before scrolling
                // content
                'scrollController': scrollController,
              },
            ),
          ),
        ),
      ),
    );
    return result;
  }
}

class _LoginPageState extends State<LoginPage> with ShowErrorDialog<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    unawaited(widget.controller.init());
    widget.viewModel.error.addListener(() {
      final Failure? failure = widget.viewModel.error.value;
      if (failure != null) {
        unawaited(showErrorDialog(context, failure: failure));
      }
      widget.viewModel.error.value = null;
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewModel.title),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (final context, final _) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: SingleChildScrollView(
                child: buildContentColumn(context),
              ),
            ),
          );
        },
        child: ColoredBox(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Column buildContentColumn(final BuildContext context) {
    return Column(
      children: [
        widget.headerBuilder?.call(context) ?? const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: widget.contentBuilder?.call(
                    context,
                    _formKey,
                    widget.controller.identifierEditingController,
                    widget.controller.secretEditingController,
                  ) ??
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 8.0),
                            //   child: Text(
                            //     'Enter your e-mail',
                            //     style: Theme.of(context).textTheme.headlineSmall,
                            //   ),
                            // ),
                            _buildIdentifierFormField(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 64.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 8.0),
                            //   child: Text(
                            //     'Password',
                            //     style: Theme.of(context).textTheme.headlineSmall,
                            //   ),
                            // ),
                            _buildSecretFormField(),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildSubmitButton(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildSignUpButton(context),
                          ),
                        ],
                      ),
                    ],
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(final BuildContext context) {
    return _buildButton(
      const Text('Sign-up'),
      onPressed: () {
        unawaited(widget.controller.navigateToSignUp(context));
      },
    );
  }

  Widget _buildSubmitButton() {
    return _buildButton(
      ValueListenableBuilder(
        valueListenable: widget.viewModel.loading,
        builder: (final ctx, final loading, final _) {
          return loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.grey.shade100,
                  ),
                )
              : const Text('Login');
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          _formKey.currentState!.save();
          unawaited(widget.controller.login(context));
        }
      },
    );
  }

  Widget _buildButton(
    final Widget text, {
    final VoidCallback? onPressed,
    final Color? foregroundColor,
    final Color? backgroundColor,
  }) {
    return OutlinedButton(
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
          (final states) => backgroundColor ?? Colors.black87,
        ),
        foregroundColor: MaterialStateColor.resolveWith(
          (final states) => foregroundColor ?? Colors.grey.shade100,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: text,
      ),
    );
  }

  Widget _buildSecretFormField() {
    return ValueListenableBuilder(
      valueListenable: widget.viewModel.secretVisible,
      builder: (
        final context,
        final visible,
        final _,
      ) {
        return TextFormField(
          controller: widget.controller.secretEditingController,
          obscureText: visible,
          onSaved: (final val) => widget.viewModel.userSecret = val!,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {
                widget.viewModel.secretVisible.value = !visible;
              },
              icon: Icon(
                visible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIdentifierFormField() {
    return TextFormField(
      controller: widget.controller.identifierEditingController,
      onSaved: (final val) => widget.viewModel.userIdentifier = val!,
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}
