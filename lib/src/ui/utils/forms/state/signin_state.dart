import 'package:ebank/src/ui/utils/forms/validators/signin_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState(SignInValidator form) = _SignInState;
}
