import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

Future<ApiCallResponse> getMyBooksCall({
  String ktore = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'getMyBooks',
    apiUrl: 'https://szufladka.herokuapp.com/szufladka/ksiazki',
    callType: ApiCallType.GET,
    headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQzMjk3NjgxLCJpYXQiOjE2Mzg5Nzc2ODEsImp0aSI6IjBiNWIwNDY4YmU3NzQ3ZjI4MTc0YjczOTIxNWQyMDM1IiwidXNlcl9pZCI6MX0.gcd0VQMSjrQYY_5WvujM_9lEdLHlkWppPsffYsnMMP8',
    },
    params: {
      'ktore': ktore,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> getBooksFromSzufladkaCall({
  String ktore = 'szufladka',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'getBooksFromSzufladka',
    apiUrl: 'https://szufladka.herokuapp.com/szufladka/ksiazki',
    callType: ApiCallType.GET,
    headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQzMjk3NjgxLCJpYXQiOjE2Mzg5Nzc2ODEsImp0aSI6IjBiNWIwNDY4YmU3NzQ3ZjI4MTc0YjczOTIxNWQyMDM1IiwidXNlcl9pZCI6MX0.gcd0VQMSjrQYY_5WvujM_9lEdLHlkWppPsffYsnMMP8',
    },
    params: {
      'ktore': ktore,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> borrowBookCall({
  int id,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'borrowBook',
    apiUrl: 'https://szufladka.herokuapp.com/szufladka/ksiazki/id/wez',
    callType: ApiCallType.POST,
    headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQzMjk5MzcwLCJpYXQiOjE2Mzg5NzkzNzAsImp0aSI6ImNhNzk4Njk5MDI3NjRjNDhiZTMxYzFlMTRiN2NjMjE0IiwidXNlcl9pZCI6MX0.KLlxdQyiHMNc5l1lsQO45lMbUod94YedePGU0DjL0-U',
    },
    params: {
      'id': id,
    },
    bodyType: BodyType.JSON,
    returnBody: true,
  );
}

Future<ApiCallResponse> getBackBookCall() {
  return ApiManager.instance.makeApiCall(
    callName: 'getBackBook',
    apiUrl: 'https://szufladka.herokuapp.com/szufladka/ksiazki/id/wez',
    callType: ApiCallType.POST,
    headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQzMjk5MzcwLCJpYXQiOjE2Mzg5NzkzNzAsImp0aSI6ImNhNzk4Njk5MDI3NjRjNDhiZTMxYzFlMTRiN2NjMjE0IiwidXNlcl9pZCI6MX0.KLlxdQyiHMNc5l1lsQO45lMbUod94YedePGU0DjL0-U',
    },
    params: {},
    bodyType: BodyType.JSON,
    returnBody: true,
  );
}

Future<ApiCallResponse> createBookCall({
  String tytul = '',
  String autor = '',
  int rokWydania,
  String wydawnictwo = '',
}) {
  final body = '''
{
  "tytul": "${tytul}",
  "autor": "${autor}",
  "wydawnictwo": "${wydawnictwo}",
  "rok_wydania": ${rokWydania}
}''';
  return ApiManager.instance.makeApiCall(
    callName: 'createBook',
    apiUrl: 'https://szufladka.herokuapp.com/szufladka/ksiazki',
    callType: ApiCallType.POST,
    headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQzMjk5MzcwLCJpYXQiOjE2Mzg5NzkzNzAsImp0aSI6ImNhNzk4Njk5MDI3NjRjNDhiZTMxYzFlMTRiN2NjMjE0IiwidXNlcl9pZCI6MX0.KLlxdQyiHMNc5l1lsQO45lMbUod94YedePGU0DjL0-U',
    },
    params: {
      'tytul': tytul,
      'autor': autor,
      'rok_wydania': rokWydania,
      'wydawnictwo': wydawnictwo,
    },
    body: body,
    bodyType: BodyType.JSON,
    returnBody: true,
  );
}
