import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_account.freezed.dart';

enum WalletAccountType {
  current,
  fixedDeposit,
  nominated,
  personal,
  savings,
}

@freezed
class WalletAccount with _$WalletAccount {
  const factory WalletAccount({
    required double id,
    required String accountNumber,
    required double amount,
    required WalletAccountType type,
    DateTime? validityPeriod,
}) = _WalletAccount;
}
