import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/latihan_modul6/post_model.dart';
import 'package:hotel_booking_app/latihan_modul6/post_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'post_service_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test
@GenerateMocks([http.Client, PostService])
void main() {
  late PostService postService;
  late MockClient mockClient;

  setUp(() {
    // Set up MockClient and ApiService for each test
    mockClient = MockClient();
    postService = PostService();
  });

  group('PostService', () {
    test('fetchPosts', () async {
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
          .thenAnswer((_) async => http.Response(
              '{"userId": 1, "id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}',
              200));
      final result = await postService.fetchPosts();

      expect(result, isA<Posts>());
      expect(result.userId, 1);
      expect(result.id, 1);
      expect(result.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit");
      expect(result.body, "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto");
    });
  });
}
