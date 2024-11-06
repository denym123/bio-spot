import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../complaint/models/complaint_model.dart';

class ComplaintDetailRepository extends RepositoryLifeCycle {
  Future<ComplaintModel?> getComplaint(int id) async {
    Response? response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: "${WebServiceUrl.complaints}/$id",
      needsAuthorization: true,
    );
    return ComplaintModel.fromJson(response?.data['data']);
  }

  Future<void> discardComplaint(int id) async {
    await httpAdapter.request(
      httpMethod: HttpMethod.post,
      url: "${WebServiceUrl.complaints}/$id",
      needsAuthorization: true,
    );
  }

  Future<void> confirmComplaint(int id) async {
    await httpAdapter.request(
        httpMethod: HttpMethod.post,
        url: "${WebServiceUrl.complaints}/$id/confirm",
        needsAuthorization: true,
        data: {'notes': "legalllll"});
  }
}
