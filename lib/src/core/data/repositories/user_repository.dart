import 'package:ebank/src/core/data/datasource/index.dart';
import 'package:ebank/src/core/data/models/index.dart';

class UserRepository {
  final LocalDataSource _dataSource;

  UserRepository(this._dataSource);

  Future<User?> getCurrentUser() async {
    try {
      return await _dataSource.getCurrentUser();
    } catch (e) {
      throw '$e';
    }
  }

  Future<User?> signIn(String username, String password) async {
    try {
      return await _dataSource.signInUser(username, password);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> addUser(User user) async {
    try {
      await _dataSource.addUser(user);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> deleteUser(User user) async {
    try {
      await _dataSource.deleteUser(user);
    } catch (e) {
      throw '$e';
    }
  }

  Future<List<User>> getAllUsers() async {
    try {
      return await _dataSource.getAllUsers();
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _dataSource.updateUser(user);
    } catch (e) {
      throw '$e';
    }
  }
}
