import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../dtos/login_request_dto.dart';

class LoginRepository extends RepositoryLifeCycle {
  Future<UserModel> login(LoginRequestDto request) async {
    Response? response = await httpAdapter.request(
      httpMethod: HttpMethod.post,
      url: WebServiceUrl.login,
      data: request.toJson(),
      needsAuthorization: false,
    );

    return UserModel.fromJson(response!.data['data']);
  }
}
