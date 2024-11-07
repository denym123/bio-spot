import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../suspect/models/suspect_model.dart';
import '../models/plague_type_model.dart';

class SuspectDetailRepository extends RepositoryLifeCycle {
  Future<SuspectModel?> getSuspect(int id) async {
    Response? response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: "${WebServiceUrl.suspects}/$id",
      needsAuthorization: true,
    );
    return SuspectModel.fromJson(response?.data['data']);
  }

  Future<void> discardSuspect(int id) async {
    await httpAdapter.request(
      httpMethod: HttpMethod.post,
      url: "${WebServiceUrl.suspects}/$id/discard",
      needsAuthorization: true,
    );
  }

  Future<List<PlagueTypeModel>> getPlagueTypes() async {
    Response? response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: "${WebServiceUrl.plagues}/plague_types",
      needsAuthorization: true,
    );
    return List.from(response?.data['data'])
        .map((e) => PlagueTypeModel.fromJson(e))
        .toList();
  }

  Future<void> confirmSuspect(String notes, int id) async {
    await httpAdapter.request(
        httpMethod: HttpMethod.post,
        url: "${WebServiceUrl.suspects}/$id/confirm",
        needsAuthorization: true,
        data: {'notes': notes});
  }
}
