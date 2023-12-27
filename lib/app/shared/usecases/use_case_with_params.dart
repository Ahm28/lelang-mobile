import 'package:dartz/dartz.dart';

import '../shared.dart';

abstract class UseCaseWithParams<T, P> {
  Future<Either<Failure, T>> call(P params);
}
