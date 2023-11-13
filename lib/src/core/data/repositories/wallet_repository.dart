import 'package:ebank/src/core/data/datasource/index.dart';
import 'package:ebank/src/core/data/models/index.dart';

class WalletRepository {
  final LocalDataSource _dataSource;
  WalletRepository(this._dataSource);

  Future<List<WalletAccount>> getAllWallets() async {
    try {
      return await _dataSource.getAllWallets();
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> addWallet(WalletAccount wallet) async {
    try {
      await _dataSource.addWallet(wallet);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> updateWallet(WalletAccount wallet) async {
    try {
      await _dataSource.updateWallet(wallet);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> deleteWallet(WalletAccount wallet) async {
    try {
      await _dataSource.deleteWallet(wallet);
    } catch (e) {
      throw '$e';
    }
  }
}
