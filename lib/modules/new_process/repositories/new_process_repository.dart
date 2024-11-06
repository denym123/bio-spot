import 'package:dio/dio.dart';

import '../../../core/core.dart';
import '../../new_process/new_process.dart';
import '../dtos/new_process_request_dto.dart';

class NewProcessRepository extends RepositoryLifeCycle {
  Future<void> sendNewComplaintProcess(NewProcessRequestDto request) async {
    await httpAdapter.request(
        httpMethod: HttpMethod.post,
        url: WebServiceUrl.complaints,
        data: request.toJson(),
        needsAuthorization: true);
  }

  Future<void> sendNewSuspectProcess(NewProcessRequestDto request) async {
    await httpAdapter.request(
        httpMethod: HttpMethod.post,
        url: WebServiceUrl.suspects,
        data: request.toJson(),
        needsAuthorization: true);
  }
}
