import 'package:biospot/modules/plague/models/plague_model.dart';
import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../suspect/suspect.dart';

class PlagueRepository extends RepositoryLifeCycle {
  Future<List<PlagueModel>> fetchPlagues() async {
    var response = await httpAdapter.request(
        httpMethod: HttpMethod.get,
        url: WebServiceUrl.plagues,
        needsAuthorization: true);
    return List.from(response?.data['data'])
        .map((e) => PlagueModel.fromJson(e))
        .toList();
  }
}
