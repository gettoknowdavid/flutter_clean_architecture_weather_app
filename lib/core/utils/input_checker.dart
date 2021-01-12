import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_weather_app/core/error/failures.dart';

class InputChecker {
  Either<Failure, String> checkInput(String input) {
    try {
      // Checks if the inputed string is a number and
      // also checks if the inputed string contains any number
      if (input.contains(RegExp(r'[0-9]'))) {
        throw FormatException();
      } else {
        return Right(input);
      }
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
