import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/use_cases/get_specific_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetSpecificNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late int number;
  late NumberTrivia numberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetSpecificNumberTrivia(mockNumberTriviaRepository);
    number = 1;
    numberTrivia = NumberTrivia(text: 'sample text', number: number);
  });

  test('should get trivia for the number from the repository', () async {
    // Arrange
    when(mockNumberTriviaRepository.getSpecificNumberTrivia(number))
        .thenAnswer((_) async => Right(numberTrivia));

    // Act
    final result = await useCase.execute(number: number);

    // Assert
    expect(result, Right(numberTrivia));
    verify(mockNumberTriviaRepository.getSpecificNumberTrivia(number));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
