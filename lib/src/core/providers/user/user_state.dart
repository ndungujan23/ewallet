import 'package:equatable/equatable.dart';
import 'package:ebank/src/core/data/index.dart';

class UserState extends Equatable {
  const UserState({ this.user });
  const UserState.initial({ this.user });

  final User? user;

  UserState copyWith({ User? user }) {
    return UserState(user: user);
  }

  @override
  List<Object> get props => [];
}
