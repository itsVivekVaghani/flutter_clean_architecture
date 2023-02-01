import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:layer_first_api/src/models/post.dart';
import 'package:post_repository/post_repository.dart' show PostRepository;

part 'post_state.dart';
part 'post_cubit.g.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._postrepository) : super( PostState());

  final PostRepository _postrepository;

  Future<void> fetchPost() async {
    emit(state.copyWith(status: PostStatus.loading));

    try {
      final posts = await _postrepository.getPosts();
      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: posts,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<void> refreshWeather() async {
    if (!state.status.isSuccess) return;
    if (state.posts.isEmpty) return;
    try {
      final posts = await _postrepository.getPosts();
      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: posts,
        ),
      );
    } on Exception {
      emit(state);
    }
  }


  @override
  PostState fromJson(Map<String, dynamic> json) =>
      PostState.fromJson(json);

  @override
  Map<String, dynamic> toJson(PostState state) => state.toJson();
}