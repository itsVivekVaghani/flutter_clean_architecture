// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_cubit.dart';


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostState _$PostStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PostState',
      json,
          ($checkedConvert) {
        final val = PostState(
          status: $checkedConvert(
              'status',
                  (v) =>
              $enumDecodeNullable(_$PostStatusEnumMap, v) ??
                  PostStatus.initial),
          posts: $checkedConvert(
              'Post',
                  (v) => v == null
                  ? null
                  : (v as List?) != null
                      ? (v as List)
                      .map((i) => Post.fromJson(i))
                      .toList()
                      : [],
          ),
        );
        return val;
      },
    );

Map<String, dynamic> _$PostStateToJson(PostState instance) =>
    <String, dynamic>{
      'status': _$PostStatusEnumMap[instance.status]!,
      'Post': instance.toJson(),
    };

const _$PostStatusEnumMap = {
  PostStatus.initial: 'initial',
  PostStatus.loading: 'loading',
  PostStatus.success: 'success',
  PostStatus.failure: 'failure',
};

