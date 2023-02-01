// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Post',
  json,
      ($checkedConvert) {
    final val = Post(
      id: $checkedConvert('id', (v) => v as int),
      userId: $checkedConvert('userId', (v) => v as int),
      title: $checkedConvert('title', (v) => v as String),
      body: $checkedConvert('body', (v) => v as String),
    );
    return val;
  },
);
