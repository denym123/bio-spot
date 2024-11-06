import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../complaint/complaint.dart';
import '../models/complaint_model.dart';

class ComplaintRepository extends RepositoryLifeCycle {
  Future<List<ComplaintModel>> getComplaints() async {
    Response? response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: WebServiceUrl.complaints,
      needsAuthorization: true,
    );

    return List.from(response!.data['data'])
        .map((e) => ComplaintModel.fromJson(e))
        .toList();
  }
}
