import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/platform/network_info.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockNumberTriviaLocalDataSource extends Mock
    implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late NumberTriviaRepositoryImpl repository;
  late MockNumberTriviaLocalDataSource mockLocalDataSource;
  late MockNumberTriviaRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  const int number = 1;
  const NumberTriviaModel numberTriviaModel =
      NumberTriviaModel(text: 'Sample text', number: number);
  const NumberTrivia numberTrivia = numberTriviaModel;

  setUp(() {
    mockLocalDataSource = MockNumberTriviaLocalDataSource();
    mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
        localDataSource: mockLocalDataSource,
        remoteDataSource: mockRemoteDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('getSpecificNumberTrivia', () {
    test('should check if device has network connection', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // Act
      repository.getSpecificNumberTrivia(number);
      // Assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should return remote data when call to remote is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getSpecificNumberTrivia(number))
          .thenAnswer((_) async => numberTriviaModel);
      // Act
      final result = await repository.getSpecificNumberTrivia(number);
      // Assert
      verify(mockRemoteDataSource.getSpecificNumberTrivia(number));
      expect(result, equals(const Right(numberTrivia)));
    });
  });

  group('device is offline', () {
    setUp(() {});

    test('should check if device has network connection', () async {
      // Arrange

      // Act

      // Assert
    });
  });
}
