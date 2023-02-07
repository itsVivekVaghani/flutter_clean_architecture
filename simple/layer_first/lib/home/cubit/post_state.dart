
part of 'post_cubit.dart';



abstract class PostState extends Equatable {}

class PostInitial extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class PostSuccess extends PostState {
  PostSuccess({required this.postResponse});

  final List<PostResponse> postResponse;

  @override
  List<Object?> get props => [postResponse];
}

class AddPostSuccess extends PostState {
  AddPostSuccess({required this.response});

  final dynamic response;

  @override
  List<Object?> get props => [response];
}

class PostFailure extends PostState {
  PostFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
