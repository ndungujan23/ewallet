import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ebank/src/core/data/index.dart';
import 'package:ebank/src/core/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  final UserRepository _repository;

  UserNotifier(this._repository): super(const UserState.initial()) {
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _repository.getCurrentUser();
      state = state.copyWith(user: user);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
