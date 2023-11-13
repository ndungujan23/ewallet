import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ebank/src/core/data/index.dart';
import 'package:ebank/src/core/providers/wallet/index.dart';

class WalletNotifier extends StateNotifier<WalletState> {
  final WalletRepository _repository;

  WalletNotifier(this._repository): super(const WalletState.initial()) {
    getWallets();
  }

  Future<void> addWallet(WalletAccount wallet) async {
    try {
      await _repository.addWallet(wallet);
      getWallets();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getWallets() async {
    state = state.copyWith(isLoading: true);
    try {
      final wallets = await _repository.getAllWallets();
      state = state.copyWith(isLoading: false, wallets: wallets);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint(e.toString());
    }
  }
}
