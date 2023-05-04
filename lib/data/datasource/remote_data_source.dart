import '../network/app_api.dart';
import '../network/requests.dart';
import '../response/responses.dart';

abstract class BaseRemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSource extends BaseRemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSource(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }
}
