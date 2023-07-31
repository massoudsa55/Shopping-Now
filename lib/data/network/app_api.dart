import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/endpoints.dart';
import '../response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(EndPoints.login)
  Future<AuthenticationResponse> login(
    @Field(EndPoints.fieldEmail) String email,
    @Field(EndPoints.fieldPassword) String password,
  );
}
