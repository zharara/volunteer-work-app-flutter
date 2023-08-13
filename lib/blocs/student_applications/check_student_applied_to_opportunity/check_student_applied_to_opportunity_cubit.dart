import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../main.dart';

part 'check_student_applied_to_opportunity_state.dart';

class CheckStudentAppliedToOpportunityCubit
    extends Cubit<CheckStudentAppliedToOpportunityState> {
  final ApiClient apiClient;

  CheckStudentAppliedToOpportunityCubit(this.apiClient)
      : super(CheckStudentAppliedToOpportunityInitial());

  Future<void> checkStudentAppliedToOpportunity(
      int volunteerOpportunityId) async {
    emit(CheckStudentAppliedToOpportunityLoading());

    try {
      final data = apiClient.handleResponse<List<StudentApplicationDto>>(
        await apiClient.api.apiStudentApplicationsGetListGet(
          studentId: globalAppStorage.getStudentAccount()?.id ?? 0,
          volunteerOpportunityId: volunteerOpportunityId,
          maxResultCount: 1000,
        ),
      );

      if (data.isEmpty) {
        emit(CheckStudentAppliedToOpportunityEmpty());
      } else {
        emit(CheckStudentAppliedToOpportunitySuccess(data));
      }
    } catch (error) {
      emit(CheckStudentAppliedToOpportunityError(error));
    }
  }

  void updateItemInternally(StudentApplicationDto itemDto) {
    if (state is CheckStudentAppliedToOpportunitySuccess) {
      final data = (state as CheckStudentAppliedToOpportunitySuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(CheckStudentAppliedToOpportunitySuccess(data));
    }
  }

  void addItemInternally(StudentApplicationDto itemDto) {
    List<StudentApplicationDto> data = [];

    if (state is CheckStudentAppliedToOpportunitySuccess) {
      data = (state as CheckStudentAppliedToOpportunitySuccess).data;
    }

    data.insert(0, itemDto);
    emit(CheckStudentAppliedToOpportunitySuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is CheckStudentAppliedToOpportunitySuccess) {
      final data = (state as CheckStudentAppliedToOpportunitySuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(CheckStudentAppliedToOpportunitySuccess(data));
    }
  }
}
