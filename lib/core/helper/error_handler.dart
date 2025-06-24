import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class FormattedErrorModel {
  final String userMessage;
  final String systemMessage;

  FormattedErrorModel({
    required this.userMessage, // Message shown to the user
    required this.systemMessage, // Detailed message for debugging/logging
  });

  // Convert the error model to a map for logging or sending to the backend
  Map<String, dynamic> toMap() {
    return {
      'userMessage': userMessage,
      'systemMessage': systemMessage,
    };
  }
}

FormattedErrorModel handleError(Exception e, StackTrace stackTrace) {
  String systemMessage = e.toString(); // Raw exception message
  String userMessage =
      'An unexpected error occurred. Please try again later.'; // Default user message

  // Map specific error types to more user-friendly messages
  if (e is FormatException) {
    userMessage =
        'The format of the data is incorrect. Please check your input.';
  } else if (e is SocketException) {
    userMessage = 'Network error. Please check your internet connection.';
  } else if (e is TimeoutException) {
    userMessage = 'The request timed out. Please try again later.';
  } else if (e is RangeError) {
    userMessage =
        'The value you provided is out of range. Please check and try again.';
  } else if (e is IOException) {
    userMessage =
        'There was an issue with reading/writing files. Please try again.';
  } else if (e is HttpException) {
    userMessage = 'There was an issue with the server. Please try again later.';
  } else if (e is FlutterError) {
    userMessage = 'A Flutter-specific error occurred. Please try again later.';
  } else {
    userMessage = 'An unknown error occurred. Please try again later.';
  }

  // Add system-specific details like the stack trace for developers
  systemMessage += '\nStackTrace: $stackTrace';

  // Return the formatted error
  return FormattedErrorModel(
      userMessage: userMessage, systemMessage: systemMessage);
}
