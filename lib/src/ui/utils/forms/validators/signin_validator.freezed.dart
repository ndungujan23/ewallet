// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_validator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInValidator {
  Field get username => throw _privateConstructorUsedError;
  Field get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInValidatorCopyWith<SignInValidator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInValidatorCopyWith<$Res> {
  factory $SignInValidatorCopyWith(
          SignInValidator value, $Res Function(SignInValidator) then) =
      _$SignInValidatorCopyWithImpl<$Res, SignInValidator>;
  @useResult
  $Res call({Field username, Field password});

  $FieldCopyWith<$Res> get username;
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class _$SignInValidatorCopyWithImpl<$Res, $Val extends SignInValidator>
    implements $SignInValidatorCopyWith<$Res> {
  _$SignInValidatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Field,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get username {
    return $FieldCopyWith<$Res>(_value.username, (value) {
      return _then(_value.copyWith(username: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get password {
    return $FieldCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignInValidatorImplCopyWith<$Res>
    implements $SignInValidatorCopyWith<$Res> {
  factory _$$SignInValidatorImplCopyWith(_$SignInValidatorImpl value,
          $Res Function(_$SignInValidatorImpl) then) =
      __$$SignInValidatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field username, Field password});

  @override
  $FieldCopyWith<$Res> get username;
  @override
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class __$$SignInValidatorImplCopyWithImpl<$Res>
    extends _$SignInValidatorCopyWithImpl<$Res, _$SignInValidatorImpl>
    implements _$$SignInValidatorImplCopyWith<$Res> {
  __$$SignInValidatorImplCopyWithImpl(
      _$SignInValidatorImpl _value, $Res Function(_$SignInValidatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$SignInValidatorImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Field,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field,
    ));
  }
}

/// @nodoc

class _$SignInValidatorImpl extends _SignInValidator {
  const _$SignInValidatorImpl({required this.username, required this.password})
      : super._();

  @override
  final Field username;
  @override
  final Field password;

  @override
  String toString() {
    return 'SignInValidator(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInValidatorImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInValidatorImplCopyWith<_$SignInValidatorImpl> get copyWith =>
      __$$SignInValidatorImplCopyWithImpl<_$SignInValidatorImpl>(
          this, _$identity);
}

abstract class _SignInValidator extends SignInValidator {
  const factory _SignInValidator(
      {required final Field username,
      required final Field password}) = _$SignInValidatorImpl;
  const _SignInValidator._() : super._();

  @override
  Field get username;
  @override
  Field get password;
  @override
  @JsonKey(ignore: true)
  _$$SignInValidatorImplCopyWith<_$SignInValidatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
