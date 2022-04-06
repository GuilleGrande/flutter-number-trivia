import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time the
  /// user had internet connection
  ///
  /// Throws [CacheException] if no local data is present
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Cache the last received [NumberTriviaModel] to the local storage
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
