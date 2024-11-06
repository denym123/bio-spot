enum HttpMethod {
  get,
  post,
  patch,
  put,
  delete,
  download,
}

extension HttpMethodExtension on HttpMethod {
  String name() {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.download:
        return 'DOWNLOAD';
    }
  }
}
