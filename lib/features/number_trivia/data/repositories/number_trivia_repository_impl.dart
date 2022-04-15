import 'package:flutter_number_trivia/core/platform/network_info.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../data_sources/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaLocalDataSource localDataSource;
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia() {
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>>? getSpecificNumberTrivia(
      int number) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.getSpecificNumberTrivia(number)!);
  }
}
