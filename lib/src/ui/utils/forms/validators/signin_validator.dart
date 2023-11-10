import 'package:ebank/src/ui/utils/forms/models/field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_validator.freezed.dart';

@freezed
class SignInValidator with _$SignInValidator {
  const SignInValidator._();

  const factory SignInValidator({
    required Field username,
    required Field password,
  }) = _SignInValidator;

  factory SignInValidator.empty() => const SignInValidator(
        username: Field(value: ''),
        password: Field(value: ''),
      );

  bool get isValid => username.isValid && password.isValid;
}
