import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../cleanboot.dart';
import 'subscribe_controller.dart';
import 'subscribe_view_model.dart';

/// {@template SubscribePage}
/// Provides a form to subscribe a user to the service
/// {@endtemplate}
class SubscribePage extends StatefulWidget {
  static const name = 'SubscribePage';
  static const path = '/subscribe';

  final SubscribePageViewModel viewModel;
  final SubscribePageController controller;

  const SubscribePage({
    required this.viewModel,
    required this.controller,
    super.key,
  });

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage>
    with ShowErrorDialog<SubscribePage> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'subscribeFormKey');

  @override
  void initState() {
    super.initState();
    widget.controller.init();
    widget.viewModel.subscriptionResponseState.addListener(() {
      if (widget.viewModel.subscriptionResponseState.value == SubscriptionStatus.success) {
        _showSuccessAlert();
      }
    });

    widget.viewModel.error.addListener(() async {
      final failure = widget.viewModel.error.value;
      if (failure != null) {
        await showErrorDialog(context, failure: failure);
        widget.viewModel.error.value = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subscribe')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Choose Your Plan',
                  style: Theme.of(context).textTheme.headline6,
                ),
                ..._buildPlanOptions(),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _attemptSubscription,
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPlanOptions() {
    // Assuming `planOptions` is a list of plan details provided by the ViewModel
    return widget.viewModel.planOptions.map((plan) {
      return ListTile(
        title: Text(plan.name),
        subtitle: Text('\$${plan.price}/month'),
        leading: Radio<String>(
          value: plan.id,
          groupValue: widget.viewModel.selectedPlanId,
          onChanged: (value) {
            if (value != null) {
              widget.viewModel.selectPlan(value);
            }
          },
        ),
      );
    }).toList();
  }

  void _attemptSubscription() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.controller.subscribe();
    } else {
      debugPrint('Plan selection is required.');
    }
  }

  void _showSuccessAlert() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Subscription Successful'),
          content: const Text('Thank you for subscribing!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.controller.navigateHome(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
