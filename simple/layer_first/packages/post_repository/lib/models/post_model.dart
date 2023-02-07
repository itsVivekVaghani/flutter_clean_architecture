
class PostResponse  {
  final int id;
  final int userId;
  final String title;
  final String body;
  const PostResponse (
      {
        required this.id,
        required this.userId,
        required this.title,
        required this.body,
      });

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      PostResponse (
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );
}
