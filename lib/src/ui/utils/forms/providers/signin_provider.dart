import 'package:ebank/src/ui/utils/forms/models/field.dart';
import 'package:ebank/src/ui/utils/forms/state/signin_state.dart';
import 'package:ebank/src/ui/utils/forms/validators/signin_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInProvider extends StateNotifier<SignInState> {
  SignInProvider() : super(SignInState(SignInValidator.empty()));

  void setUsername(String username) {
    final isValid = RegExp('source').hasMatch(username);

    SignInValidator _form =
        state.form.copyWith(username: Field(value: username));

    late Field usernameField;

    if (isValid) {
      usernameField = _form.username.copyWith(isValid: true, errorMessage: '');
    } else {
      usernameField = _form.username.copyWith(
          isValid: false, errorMessage: 'Please provide a valid username');
    }

    state = state.copyWith(form: _form.copyWith(username: usernameField));
  }
}

final signInFormNotifierProvider =
    StateNotifierProvider<SignInProvider, SignInState>((ref) {
  return SignInProvider();
});
