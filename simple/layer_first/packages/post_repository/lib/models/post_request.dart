
class PostRequest  {
  final int userId;
  final String title;
  final String body;
  const PostRequest (
      {
        required this.userId,
        required this.title,
        required this.body,
      });

  factory PostRequest.fromJson(Map<String, dynamic> json) =>
      PostRequest (
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() {
    return {
      'userId': this.userId,
      'title': this.title,
      'body': this.body,
    };
  }
}
