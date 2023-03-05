part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLaoding extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  @override
  List<UserModel> userModel = [];
  UserDataLoaded(this.userModel);

  List<Object?> get props => [userModel];
}
