import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

String url = 'https://szufladka.herokuapp.com';

Future<ApiCallResponse> borrowBookCall(int id,) {
  return ApiManager.instance.makeApiCall(
    callName: 'borrowBook',
    apiUrl: url +
        '/szufladka/ksiazki/:id:/wez'.replaceAll(":id:", id.toString()),
    callType: ApiCallType.PATCH,
    headers: {},
    bodyType: BodyType.JSON,
    returnBody: true,
  );
}

Future<ApiCallResponse> getBackBookCall(int id) {
  return ApiManager.instance.makeApiCall(
    callName: 'getBackBook',
    apiUrl: url +
        '/szufladka/ksiazki/:id:/oddaj'.replaceAll(":id:", id.toString()),
    callType: ApiCallType.PATCH,
    headers: {},
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
    apiUrl: url + '/szufladka/ksiazki',
    callType: ApiCallType.POST,
headers: {},
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

Future<ApiCallResponse> getBooksFromSzufladkaCall({
  String ktore = 'szufladka',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'getBooksFromSzufladka',
    apiUrl: url + '/szufladka/ksiazki',
    callType: ApiCallType.GET,
headers: {},
    params: {
      'ktore': ktore,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> getMyBooksCall({
  String ktore = 'moje',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'getMyBooks',
    apiUrl: url + '/szufladka/ksiazki',
    callType: ApiCallType.GET,
headers: {},
    params: {
      'ktore': ktore,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> login(String email, String password) {
  final body = '''{
    "kryptonim": "${email}",
    "haslo": "${password}"
  }''';
  return ApiManager.instance.makeApiCall(
    callName: 'login',
    apiUrl: url + '/autoryzacja/login/',
    callType: ApiCallType.POST,
    headers: {},
    body:body,
    bodyType: BodyType.JSON,
    returnBody: true,
  );
}
Future<ApiCallResponse> profil() {

  return ApiManager.instance.makeApiCall(
    callName: 'profil',
    apiUrl: url + '/autoryzacja/profil',
    callType: ApiCallType.GET,
    headers: {},
    returnBody: true,
  );
}

