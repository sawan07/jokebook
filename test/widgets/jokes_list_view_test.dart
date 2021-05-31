import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:jokebook/datamodels/joke.dart';
import 'package:jokebook/views/jokes_list_view.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() {
  group('fetchJokes', () {
    test('return a list of Jokes if the http call completes successfully',
        () async {
      final MockClient client = MockClient();
      var joke = Joke(id: 1, type: '', setup: '', punchline: '');
      List<Joke> jokes = <Joke>[];
      jokes.add(joke);
      print(jokes);

      when(client.get(Uri.parse(
              'https://official-joke-api.appspot.com/jokes/general/ten')))
          .thenAnswer((_) async => http.Response(
              '[{"id": 1, "type": "general", "setup": "setup","punchline":"punchline" }]',
              200));
      expect(await fetchJokes('general', client), isA<List<Joke>>());
    });

    test('throws an exception if the http call completes with an eroor', () async {
      final MockClient client = MockClient();
      when(client.get(Uri.parse(
              'https://official-joke-api.appspot.com/jokes/general/ten')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(fetchJokes('general', client), throwsException);
    });
  });
}
