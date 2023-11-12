// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletAccount {
  double get id => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  WalletAccountType get type => throw _privateConstructorUsedError;
  DateTime? get validityPeriod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletAccountCopyWith<WalletAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletAccountCopyWith<$Res> {
  factory $WalletAccountCopyWith(
          WalletAccount value, $Res Function(WalletAccount) then) =
      _$WalletAccountCopyWithImpl<$Res, WalletAccount>;
  @useResult
  $Res call(
      {double id,
      String accountNumber,
      double amount,
      WalletAccountType type,
      DateTime? validityPeriod});
}

/// @nodoc
class _$WalletAccountCopyWithImpl<$Res, $Val extends WalletAccount>
    implements $WalletAccountCopyWith<$Res> {
  _$WalletAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountNumber = null,
    Object? amount = null,
    Object? type = null,
    Object? validityPeriod = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WalletAccountType,
      validityPeriod: freezed == validityPeriod
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletAccountImplCopyWith<$Res>
    implements $WalletAccountCopyWith<$Res> {
  factory _$$WalletAccountImplCopyWith(
          _$WalletAccountImpl value, $Res Function(_$WalletAccountImpl) then) =
      __$$WalletAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double id,
      String accountNumber,
      double amount,
      WalletAccountType type,
      DateTime? validityPeriod});
}

/// @nodoc
class __$$WalletAccountImplCopyWithImpl<$Res>
    extends _$WalletAccountCopyWithImpl<$Res, _$WalletAccountImpl>
    implements _$$WalletAccountImplCopyWith<$Res> {
  __$$WalletAccountImplCopyWithImpl(
      _$WalletAccountImpl _value, $Res Function(_$WalletAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountNumber = null,
    Object? amount = null,
    Object? type = null,
    Object? validityPeriod = freezed,
  }) {
    return _then(_$WalletAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WalletAccountType,
      validityPeriod: freezed == validityPeriod
          ? _value.validityPeriod
          : validityPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$WalletAccountImpl implements _WalletAccount {
  const _$WalletAccountImpl(
      {required this.id,
      required this.accountNumber,
      required this.amount,
      required this.type,
      this.validityPeriod});

  @override
  final double id;
  @override
  final String accountNumber;
  @override
  final double amount;
  @override
  final WalletAccountType type;
  @override
  final DateTime? validityPeriod;

  @override
  String toString() {
    return 'WalletAccount(id: $id, accountNumber: $accountNumber, amount: $amount, type: $type, validityPeriod: $validityPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.validityPeriod, validityPeriod) ||
                other.validityPeriod == validityPeriod));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, accountNumber, amount, type, validityPeriod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletAccountImplCopyWith<_$WalletAccountImpl> get copyWith =>
      __$$WalletAccountImplCopyWithImpl<_$WalletAccountImpl>(this, _$identity);
}

abstract class _WalletAccount implements WalletAccount {
  const factory _WalletAccount(
      {required final double id,
      required final String accountNumber,
      required final double amount,
      required final WalletAccountType type,
      final DateTime? validityPeriod}) = _$WalletAccountImpl;

  @override
  double get id;
  @override
  String get accountNumber;
  @override
  double get amount;
  @override
  WalletAccountType get type;
  @override
  DateTime? get validityPeriod;
  @override
  @JsonKey(ignore: true)
  _$$WalletAccountImplCopyWith<_$WalletAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
