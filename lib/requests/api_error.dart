class RequestError {
  final String? httpStatus;
  final String? exceptionType;
  final List<ItemError>? errors;

  RequestError({this.httpStatus, this.exceptionType, this.errors});

  factory RequestError.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'httpStatus': final String? httpStatus,
        'exceptionType': final String? exceptionType,
        'errors': final List<dynamic>? errors,
      } =>
        RequestError(
          httpStatus: httpStatus,
          exceptionType: exceptionType,
          errors: errors
              ?.map((e) => ItemError.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      _ => throw Exception('Invalid JSON format for RequestError'),
    };
  }
}

class ItemError {
  final String? entity;
  final String? fieldName;
  final String? code;
  final String? message;

  ItemError({this.entity, this.fieldName, this.code, this.message});

  factory ItemError.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'entity': final String? entity,
        'fieldName': final String? fieldName,
        'code': final String? code,
        'message': final String? message,
      } =>
        ItemError(
          entity: entity,
          fieldName: fieldName,
          code: code,
          message: message,
        ),
      _ => throw Exception('Invalid JSON format for ItemError'),
    };
  }
}
