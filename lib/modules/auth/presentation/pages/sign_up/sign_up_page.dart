import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../cleanboot.dart';
import 'sign_up_controller.dart';
import 'sign_up_view_model.dart';

/// {@template SignUp}
/// Provides form to sign up a user to the service
/// {@endtemplate}
class SignUpPage extends StatefulWidget {
  /// {@macro Widget.PageName}
  static const name = 'SignUpPage';

  /// {@macro Widget.PagePath}
  static const path = '/sign-up';

  /// {@macro Widget.ViewModel}
  final SignUpPageViewModel viewModel;

  /// {@macro Widget.Controller}
  final SignUpPageController controller;

  /// {@macro SignUp}
  const SignUpPage({
    required this.viewModel,
    required this.controller,
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with ShowAlertDialog<SignUpPage> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'signUpFormKey');

  @override
  void initState() {
    unawaited(widget.controller.init());
    widget.viewModel.signUpResponseState.addListener(() {
      switch (widget.viewModel.signUpResponseState.value) {
        case SignUpResponseState.success:
          _showSuccessAlert();
        case _:
          debugPrint('${widget.viewModel.signUpResponseState.value}');
      }
    });

    widget.viewModel.error.addListener(() async {
      final failure = widget.viewModel.error.value;
      if (failure != null) {
        unawaited(
          showErrorDialog(
            context,
            failure: widget.viewModel.error.value,
          ),
        );
        widget.viewModel.error.value = null;
      }
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (final context, final _) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._buildEmailSection(),
                            const SizedBox(
                              height: 35,
                            ),
                            ..._buildDisplayNameSection(),
                            const SizedBox(
                              height: 35,
                            ),
                            ..._buildPasswordSection(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        );
      },
      child: ColoredBox(
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Row _buildSubmitButton() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildButton(
              ValueListenableBuilder(
                valueListenable: widget.viewModel.loading,
                builder: (final ctx, final loading, final _) {
                  return loading
                      ? const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Submit');
                },
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  unawaited(widget.controller.signUp());
                } else {
                  debugPrint('validation failed');
                }
              },
            ),
          ),
        ),
      ],
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

  Widget _buildTitle(final String sectionTitleText) {
    return Text(
      sectionTitleText,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  List<Widget> _buildEmailSection() {
    return [
      _buildTitle('Create an account'),
      _buildSectionDescription(
        "This will link any Paintz that you've made to the newly created account.",
      ),
      _buildEmailField(),
    ];
  }

  Padding _buildSectionDescription(final String sectionDescriptionText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: _sectionText(
        sectionDescriptionText,
      ),
    );
  }

  Text _sectionText(final String sectionDescriptionText) {
    return Text(
      sectionDescriptionText,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: Theme.of(context).colorScheme.outline),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      controller: widget.controller.emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (final email) {
        if (email?.isEmpty ?? true) {
          return 'Please enter your email';
        } else if (!RegExp(
          r'^[a-zA-Z0-9.a-zA-Z0-9.+_-]+@[a-zA-Z0-9.a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$',
        ).hasMatch(email!)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: 'E-mail address',
      ),
      textInputAction: TextInputAction.next,
      autocorrect: false,
    );
  }

  List<Widget> _buildDisplayNameSection() {
    return [
      _buildTitle('Select display name'),
      _buildSectionDescription(
        'This name will be displayed to all other House Paintz users (at least 6 characters)',
      ),
      TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller.displayNameController,
        decoration: const InputDecoration(
          hintText: 'Choose a user name',
        ),
        textInputAction: TextInputAction.next,
        validator: (final displayName) {
          if (!widget.controller.validLength(displayName ?? '')) {
            return 'The display name must be at least 6 characters.';
          } else if (!widget.controller.uniqueDisplayName(displayName ?? '')) {
            return 'The display name exists already';
          } else {
            return null;
          }
        },
      ),
    ];
  }

  List<Widget> _buildPasswordSection() {
    return [
      _buildTitle(
        'Enter a password',
      ),
      _buildSectionDescription(
        'Choose a secure password:',
      ),
      _buildPasswordField(),
      const SizedBox(
        height: 10,
      ),
      buildConfirmPasswordField(),
      ListenableBuilder(
        listenable: widget.viewModel.secret,
        builder: (final context, final _) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 64.0),
            child: Column(
              children: [
                _buildPasswordCriteriaRow(
                  validator: widget.controller.validLength,
                  criteriaText: 'at least 6 letters long',
                  input: widget.viewModel.secret.value,
                ),
                _buildPasswordCriteriaRow(
                  validator: widget.controller.containsCapital,
                  criteriaText: 'at least one capital letter',
                  input: widget.viewModel.secret.value,
                ),
                _buildPasswordCriteriaRow(
                  validator: widget.controller.validNumber,
                  criteriaText: 'contains a number',
                  input: widget.viewModel.secret.value,
                ),
                _buildPasswordCriteriaRow(
                  validator: widget.controller.validCharacter,
                  criteriaText:
                      'contains a special character\n(#, ?, !, @, \$, %, ^, &, *, -)',
                  input: widget.viewModel.secret.value,
                ),
                _buildPasswordCriteriaRow(
                  validator: widget.controller.passwordsMatch,
                  criteriaText: 'passwords match',
                  input: widget.viewModel.secret.value,
                ),
              ],
            ),
          );
        },
      ),
    ];
  }

  Widget _buildPasswordCriteriaRow({
    required final bool Function(String) validator,
    required final String criteriaText,
    required final String input,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 4.0,
          ),
          child: validator(input) ? _validIcon() : _invalidIcon(),
        ),
        _sectionText(criteriaText),
      ],
    );
  }

  Widget _invalidIcon() {
    return Icon(
      Icons.close,
      color: Theme.of(context).colorScheme.error,
    );
  }

  Widget _validIcon() {
    return Icon(
      Icons.done,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildPasswordField() {
    return ValueListenableBuilder(
      valueListenable: widget.viewModel.passwordObscured,
      builder: (final context, final obscured, final _) {
        return TextFormField(
          controller: widget.controller.passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: 'Choose a password',
            suffixIcon: GestureDetector(
              onTap: () => widget.controller.togglePasswordVisibility(),
              child: Icon(
                obscured
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
            suffixIconColor: Theme.of(context).colorScheme.outline,
          ),
          textInputAction: TextInputAction.next,
          obscureText: obscured,
          autocorrect: false,
          onChanged: (final String? updated) {
            widget.viewModel.secret.value = updated ?? '';
          },
          validator: widget.controller.validatePassword,
        );
      },
    );
  }

  Widget buildConfirmPasswordField() {
    return ValueListenableBuilder(
      valueListenable: widget.viewModel.passwordObscured,
      builder: (final context, final obscured, final _) {
        return TextFormField(
          controller: widget.controller.confirmPasswordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: 'Retype your password',
            suffixIcon: GestureDetector(
              onTap: () => widget.controller.togglePasswordVisibility(),
              child: Icon(
                obscured
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
          ),
          // textInputAction: TextInputAction.done,
          obscureText: obscured,
          autocorrect: false,
          validator: (final confirmation) {
            if (widget.controller.passwordsMatch(confirmation ?? '')) {
              return null;
            } else {
              return 'Passwords must match';
            }
          },
          onChanged: (final input) {
            widget.viewModel.update();
          },
          onFieldSubmitted: (final retyped) {
            _formKey.currentState?.validate();
          },
        );
      },
    );
  }

  void _showSuccessAlert() {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (final context) {
          return AlertDialog(
            icon: const CircleAvatar(
              minRadius: 40,
              child: Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
            ),
            content: Text(
              'The account was created!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.controller.navigateHome(context);
                },
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
