import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../suspect/suspect.dart';
import '../models/suspect_model.dart';

class SuspectRepository extends RepositoryLifeCycle {
  Future<List<SuspectModel>> fetchSuspects() async {
    var response = await httpAdapter.request(
        httpMethod: HttpMethod.get,
        url: WebServiceUrl.suspects,
        needsAuthorization: true);
    return List.from(response?.data['data'])
        .map((e) => SuspectModel.fromJson(e))
        .toList();
  }
}
