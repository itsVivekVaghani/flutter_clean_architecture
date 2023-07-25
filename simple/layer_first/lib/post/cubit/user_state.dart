
part of 'user_cubit.dart';



abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserSuccess extends UserState {
  UserSuccess({required this.response});

  final List<UserModel> response;

  @override
  List<Object?> get props => [response];
}


class UserFailure extends UserState {
  UserFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
