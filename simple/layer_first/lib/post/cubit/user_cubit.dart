import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/models/post_model.dart';
import 'package:post_repository/models/post_request.dart';
import 'package:post_repository/models/user_model.dart';
import 'package:post_repository/repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required HttpsPostRepository postRepository})
      : _postRepository = postRepository,
        super(UserInitial());
  final HttpsPostRepository _postRepository;

  Future<void> getUsers() async {
    try {
      emit(UserLoading());
      final response = await _postRepository.getUsers();
      emit(
        UserSuccess(
          response: response,
        ),
      );
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }
  
}
