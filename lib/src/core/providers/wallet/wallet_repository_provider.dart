import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ebank/src/core/data/index.dart';
import 'package:ebank/src/core/providers/index.dart';

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final datasource = ref.read(localDatasourceProvider);
  return WalletRepository(datasource);
});
