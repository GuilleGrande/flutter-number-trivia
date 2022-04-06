import 'dart:convert';

import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const numberTriviaModel = NumberTriviaModel(text: 'Sample text', number: 1);

  test('should be a subclass of NumberTtrivia entity', () async {
    // Assert
    expect(numberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, numberTriviaModel);
    });

    test('should return a valid model when the JSON number is a double',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, numberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map cotaining proper data', () async {
      // Arrange
      final expectedMap = {'text': 'Sample text', 'number': 1};
      // Act
      final result = numberTriviaModel.toJson();
      // Assert
      expect(result, expectedMap);
    });
  });
}
