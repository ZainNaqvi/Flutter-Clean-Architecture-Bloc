// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NewsApiService implements NewsApiService {
  _NewsApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apiKey': apiKey,
      r'country': country,
      r'category': category,
    };
    queryParameters.removeWhere((k, v) => v == null);

    Map<String, dynamic>? _data;

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<Map<String, dynamic>>>(Options(
      method: 'GET',
      headers: {},
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/top-headlines',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    // Check if _result.data is not null
    if (_result.data != null) {
      // Assuming the structure is a map with a 'articles' key containing a list
      var articlesList = (_result.data!['articles'] as List)
          .map((dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
          .toList();

      final httpResponse = HttpResponse(articlesList, _result);

      return httpResponse;
    } else {
      // Handle the case where _result.data is null
      throw Exception("No data received");
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
