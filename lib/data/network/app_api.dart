import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants/api_constants.dart';
import '../response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}