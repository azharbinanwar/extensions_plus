import 'dart:convert';
import 'package:flutter/material.dart';

extension StringExtension on String {
  /// Capitalize first letter of string
  String capitalize() {
    if (isEmpty) return '';
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// Case-insensitive contains check
  bool containsIgnoreCase(String value) =>
      toLowerCase().contains(value.toLowerCase());

  /// Generate initials from a name
  String get initials {
    if (isEmpty) return '';
    final words = trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';

    if (words.length == 1) {
      return words.first.characters.take(2).toUpperCase().toString();
    } else {
      return '${words.first.characters.first.toUpperCase()}${words[1].characters.first.toUpperCase()}';
    }
  }

  /// Validate email format
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(this);
  }

  /// Convert to title case
  String toTitleCase() => split(' ').map((word) => word.capitalize()).join(' ');

  /// Check if string is numeric
  bool isNumeric() => RegExp(r'^\d+$').hasMatch(this);

  /// Convert to Base64
  String toBase64() => base64Encode(utf8.encode(this));

  /// Decode from Base64
  String fromBase64() => utf8.decode(base64Decode(this));

  /// Reverse string
  String get reverse => characters.toList().reversed.join();

  /// Convert to camelCase
  String toCamelCase() {
    // Handle empty or null string
    if (isEmpty) return '';

    // Split the string by underscores or hyphens
    List<String> words = split(RegExp(r'[_\-\s]'));

    // Capitalize each word except the first
    return words.asMap().entries.map((entry) {
      int index = entry.key;
      String word = entry.value;

      // First word stays lowercase, others get capitalized
      return index == 0 ? word.toLowerCase() : word.capitalize();
    }).join();
  }

  /// Convert to snake_case
  String toSnakeCase() {
    return replaceAllMapped(RegExp(r'([A-Z])'), (Match match) {
      return '_${match.group(0)!.toLowerCase()}';
    }).toLowerCase();
  }

  /// Remove all whitespace
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Remove special characters
  String trimSpecialCharacters() {
    return replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
  }

  /// Count words
  int getWordCount() {
    return split(RegExp(r'\s+')).length;
  }

  /// Truncate string
  String truncate(int maxLength, {String ellipsis = '...'}) {
    return length > maxLength ? '${substring(0, maxLength)}$ellipsis' : this;
  }

  /// Parse to double safely
  double? parseToDouble() => double.tryParse(this);

  /// Parse to int safely
  int? parseInt() => int.tryParse(this);

  /// Check password strength
  bool isStrongPassword({
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireNumbers = true,
    bool requireSpecialChars = true,
  }) {
    if (length < minLength) return false;

    if (requireUppercase && !contains(RegExp(r'[A-Z]'))) return false;
    if (requireLowercase && !contains(RegExp(r'[a-z]'))) return false;
    if (requireNumbers && !contains(RegExp(r'[0-9]'))) return false;
    if (requireSpecialChars && !contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
      return false;

    return true;
  }
}
