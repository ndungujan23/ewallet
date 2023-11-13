import 'package:ebank/src/core/data/index.dart';
import 'package:equatable/equatable.dart';

class WalletState extends Equatable {
  const WalletState({required this.isLoading, required this.wallets});

  const WalletState.initial({
    this.isLoading = false,
    this.wallets = const [],
  });

  final bool isLoading;
  final List<WalletAccount> wallets;

  WalletState copyWith({bool? isLoading, List<WalletAccount>? wallets}) {
    return WalletState(isLoading: isLoading == true, wallets: wallets ?? []);
  }

  @override
  List<Object> get props => [
        isLoading,
        wallets,
      ];
}
