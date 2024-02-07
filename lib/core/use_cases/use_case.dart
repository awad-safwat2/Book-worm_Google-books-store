import '../errors/faluer.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<ServerFalure, Type>> call([Param param]);
}

class NoParam {}
