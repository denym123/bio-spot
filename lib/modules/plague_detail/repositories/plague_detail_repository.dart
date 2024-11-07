import 'package:biospot/modules/plague/models/plague_model.dart';
import 'package:dio/dio.dart';

import '../../../core/core.dart';

class PlagueDetailRepository extends RepositoryLifeCycle {
  Future<PlagueModel?> getPlague(int id) async {
    Response? response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: "${WebServiceUrl.plagues}/$id",
      needsAuthorization: true,
    );
    return PlagueModel.fromJson(response?.data['data']);
  }

  Future<void> confirmPlague(int id) async {
    await httpAdapter.request(
        httpMethod: HttpMethod.post,
        url: "${WebServiceUrl.plagues}/$id/resolve",
        needsAuthorization: true);
  }
}
