import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    this.statusCode,
    this.error,
    this.errorMessage = '',
    this.errorCode,
  });

  final int? statusCode;
  final String? error;
  final String errorMessage;
  final String? errorCode;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    statusCode: json["statusCode"],
    error: json["error"],
    errorMessage: json["message"],
    errorCode: json["errorCode"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "error": error,
    "message": errorMessage,
    "errorCode": errorCode,
  };
}
