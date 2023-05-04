import "package:dartz/dartz.dart";

import "../models/models.dart";
import "../../data/network/requests.dart";
import "../../data/network/failure.dart";

abstract class BaseLoginRepository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
