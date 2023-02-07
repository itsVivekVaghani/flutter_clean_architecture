import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/models/post_model.dart';
import 'package:post_repository/models/post_request.dart';
import 'package:post_repository/repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required HttpsPostRepository postRepository})
      : _postRepository = postRepository,
        super(PostInitial());
  final HttpsPostRepository _postRepository;

  Future<void> getPost() async {
    try {
      emit(PostLoading());
      final response = await _postRepository.getPost();
      emit(
        PostSuccess(
          postResponse: response,
        ),
      );
    } catch (e) {
      emit(PostFailure(message: e.toString()));
    }
  }

  Future<void> addPost({required PostRequest request}) async {
    try {
      emit(PostLoading());
      final response = await _postRepository.addPosts(request: request);
      emit(AddPostSuccess(response: response));
    } catch (e) {
      emit(PostFailure(message: e.toString()));
    }
  }
}
