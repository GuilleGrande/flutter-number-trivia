import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetSpecificNumberTrivia {
  final NumberTriviaRepository repository;

  GetSpecificNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>?> call({required int number}) async {
    return await repository.getSpecificNumberTrivia(number);
  }
}
