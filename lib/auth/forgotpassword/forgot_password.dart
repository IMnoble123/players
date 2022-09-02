import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/models/form_validators.dart';
import 'package:player/views/widgets/text_button.dart';

import 'controller/forgot_paswordstate.dart';

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  String _getButtonText(FormzStatus status) {
    if (status.isSubmissionInProgress) {
      return "requesting";
    } else if (status.isSubmissionFailure) {
      return "failed";
    } else if (status.isSubmissionSuccess) {
      return "done ✅";
    } else {
      return "request";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    final status = forgotPasswordState.status;

    ref.listen<ForgotPasswordState>(
      forgotPasswordProvider,
      (previous, current) {
        if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${current.errorMessage}"),
            ),
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                hintText: "Please enter your Email",
                errorText: Email.showEmailErrorMessage(
                    forgotPasswordState.email.error),
                onChanged: (email) {
                  ref
                      .read(forgotPasswordProvider.notifier)
                      .onEmailChange(email);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: status.isSubmissionInProgress
                        ? null
                        : () {
                            Navigator.of(context).pop();
                          },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: status.isSubmissionInProgress ||
                            status.isSubmissionSuccess
                        ? null
                        : () {
                            ref
                                .read(forgotPasswordProvider.notifier)
                                .forgotPassword();
                          },
                    child: Text(_getButtonText(status)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordState {

  final Email email;
  final FormzStatus status;
  final String? errorMessage;

  const ForgotPasswordState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  ForgotPasswordState copyWith({
    Email? email,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        email,
        status,
      ];
}

