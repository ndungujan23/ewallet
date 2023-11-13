import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ebank/src/core/providers/wallet/index.dart';

final walletProvider = StateNotifierProvider<WalletNotifier, WalletState>((ref) {
  final repository = ref.watch(walletRepositoryProvider);
  return WalletNotifier(repository);
});
