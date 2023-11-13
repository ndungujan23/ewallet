import 'package:equatable/equatable.dart';

enum WalletAccountType {
  current,
  fixedDeposit,
  nominated,
  personal,
  savings;

  static WalletAccountType fromValue(String name) {
    try {
      return WalletAccountType.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return WalletAccountType.current;
    }
  }
}

class WalletAccount extends Equatable {
  final int? id;
  final String accountNumber;
  final int amount;
  final WalletAccountType type;

  const WalletAccount({
    this.id,
    required this.accountNumber,
    required this.amount,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'accountNumber': accountNumber,
      'amount': amount,
      'type': type,
    };
  }

  factory WalletAccount.fromJson(Map<String, dynamic> map) {
    return WalletAccount(
      id: map['id'],
      accountNumber: map['accountNumber'],
      amount: map['amount'],
      type: WalletAccountType.fromValue(map['type']),
    );
  }

  @override
  List<Object> get props {
    return [
      accountNumber,
      amount,
      type,
    ];
  }

  WalletAccount copyWith({
    int? id,
    String? accountNumber,
    int? amount,
    WalletAccountType? type,
  }) {
    return WalletAccount(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      accountNumber: accountNumber ?? this.accountNumber,
      type: type ?? this.type,
    );
  }
}
