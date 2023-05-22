import 'package:dartz/dartz.dart';

import '../../domain/models/models.dart';
import '../../data/mapper/mapper.dart';
import '../../domain/repository/base_login_repository.dart';
import '../datasource/remote_data_source.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class LoginRepository extends BaseLoginRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepository(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // network is connected
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // success
        return Right(response.toDomain());
      } else {
        // failure
        return Left(Failure(409, response.message ?? "Business error message"));
      }
    } else {
      // network not conncetd
      return const Left(Failure(501, "Please chack your internet connection"));
    }
  }
}
