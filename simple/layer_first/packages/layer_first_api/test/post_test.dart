
import 'package:layer_first_api/src/models/post.dart';
import 'package:test/test.dart';

void main() {
  group('Location', () {
    group('fromJson', () {
      test('returns correct Post object', () {
        expect(
          Post.fromJson(
            <String, dynamic>{
              'id': 1,
              'userId': 1,
              'title': "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              'body': "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto",
            },
          ),
          isA<Post>()
              .having((w) => w.id, 'id', 1)
              .having((w) => w.userId, 'userId', 1)
              .having((w) => w.title, 'title', "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
              .having((w) => w.body, 'body', "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"),
        );
      });
    });
  });
}
