import 'package:flutter_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import 'package:flutter_clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
    print("SetUp Ended.");
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      print(mockNumberTriviaRepository!.getConcreteNumberTrivia(4));
      // print(mockNumberTriviaRepository!.getConcreteNumberTrivia(0));
      // Arrange
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      // when(mockNumberTriviaRepository!.getConcreteNumberTrivia(7))
      //     .thenAnswer((_) async => Right<Failure, NumberTrivia>(tNumberTrivia));

      // Act
      // The "act" phase of the test. Call the not-yet-existent method.
      // final result = await usecase!.execute(number: tNumber);

      // Assert
      // UseCase should simply return whatever was returned from the Repository
      // expect(result, Right(tNumberTrivia));

      // // Verify
      // // Verify that the method has been called on the Repository
      // verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber))
      //     .called(1);

      // // Verify that there are no more interactions with the repository.
      // verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
