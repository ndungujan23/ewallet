import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ebank/src/core/providers/user/user_notifier.dart';
import 'package:ebank/src/core/providers/user/user_repository_provider.dart';
import 'package:ebank/src/core/providers/user/user_state.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserNotifier(repository);
});
