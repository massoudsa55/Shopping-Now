import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/app_constants.dart';
import '../response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(AppConstants.endPointLogin)
  Future<AuthenticationResponse> login(
    @Field(AppConstants.fieldEmail) String email,
    @Field(AppConstants.fieldPassword) String password,
  );
}
