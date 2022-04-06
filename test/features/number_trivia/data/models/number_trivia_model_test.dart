import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const numberTriviaModel = NumberTriviaModel(text: 'Sample text', number: 1);

  test('should be a subclass of NumberTtrivia entity', () async {
    // Assert
    expect(numberTriviaModel, isA<NumberTrivia>());
  });
}
