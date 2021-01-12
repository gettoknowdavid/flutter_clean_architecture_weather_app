import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_weather_app/core/utils/input_checker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputChecker inputChecker;

  setUp(() {
    inputChecker = InputChecker();
  });

  group(
    'inputChecker',
    () {
      test(
        'should return a string when the input is a string',
        () async {
          final input = 'abc';

          final result = inputChecker.checkInput(input);

          expect(result, Right('abc'));
        },
      );

      test(
        'should return a Failure when the input is an integer',
        () async {
          final input = '123';

          final result = inputChecker.checkInput(input);

          expect(result, Left(InvalidInputFailure()));
        },
      );

      test(
        'should return a Failure when the input contains an integer',
        () async {
          final input = '1sas3';

          final result = inputChecker.checkInput(input);

          expect(result, Left(InvalidInputFailure()));
        },
      );
    },
  );
}
