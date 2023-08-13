import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_applications_for_opportunity_state.dart';

class GetApplicationsForOpportunityCubit
    extends Cubit<GetApplicationsForOpportunityState> {
  final ApiClient apiClient;

  GetApplicationsForOpportunityCubit(this.apiClient)
      : super(GetApplicationsForOpportunityInitial());

  Future<void> getApplicationsForOpportunity(
      {required int opportunityId}) async {
    emit(GetApplicationsForOpportunityLoading());

    try {
      final data = apiClient.handleResponse<List<StudentApplicationDto>>(
          await apiClient.api.apiStudentApplicationsGetListGet(
        volunteerOpportunityId: opportunityId,
        maxResultCount: 100000,
      ));

      if (data.isEmpty) {
        emit(GetApplicationsForOpportunityEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetApplicationsForOpportunitySuccess(data));
      }
    } catch (error) {
      emit(GetApplicationsForOpportunityError(error));
    }
  }

  void updateItemInternally(StudentApplicationDto applicationDto) {
    if (state is GetApplicationsForOpportunitySuccess) {
      final data = (state as GetApplicationsForOpportunitySuccess).data;
      int index = data.indexWhere((e) => e.id == applicationDto.id);
      if (index != -1) {
        data[index] = applicationDto;
        emit(GetApplicationsForOpportunitySuccess(data));
      }
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetApplicationsForOpportunitySuccess) {
      final data = (state as GetApplicationsForOpportunitySuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetApplicationsForOpportunitySuccess(data));
    }
  }
}
