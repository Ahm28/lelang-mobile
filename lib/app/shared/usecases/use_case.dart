import 'package:dartz/dartz.dart';

import '../shared.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}
