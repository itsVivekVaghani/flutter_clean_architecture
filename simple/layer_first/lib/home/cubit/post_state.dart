part of 'post_cubit.dart';
enum PostStatus { initial, loading, success, failure }

extension PostStatusX on PostStatus {
  bool get isInitial => this == PostStatus.initial;
  bool get isLoading => this == PostStatus.loading;
  bool get isSuccess => this == PostStatus.success;
  bool get isFailure => this == PostStatus.failure;
}

@JsonSerializable()
class PostState extends Equatable {
  PostState({
    this.status = PostStatus.initial,
    List<Post>? posts,
  }) : posts = posts ?? [];

  factory PostState.fromJson(Map<String, dynamic> json) =>
      _$PostStateFromJson(json);

  final PostStatus status;
  final List<Post> posts;

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toJson() => _$PostStateToJson(this);

  @override
  List<Object?> get props => [status, posts];
}
