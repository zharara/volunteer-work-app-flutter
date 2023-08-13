import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'student_view_opportunities_state.dart';

class StudentViewOpportunitiesCubit
    extends Cubit<StudentViewOpportunitiesState> {
  final ApiClient apiClient;

  StudentViewOpportunitiesCubit(this.apiClient)
      : super(StudentViewOpportunitiesInitial());

  viewOpportunities({String? filter, int? organizationId}) async {
    emit(StudentViewOpportunitiesLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerOpportunityDto>>(
        await apiClient.api.apiVolunteerOpportunitiesGetListGet(
          filter: filter,
          organizationId: organizationId,
        ),
      );

      if (data.isEmpty) {
        emit(StudentViewOpportunitiesEmpty());
      } else {
        emit(StudentViewOpportunitiesSuccess(data));
      }
    } catch (error) {
      emit(StudentViewOpportunitiesError(error));
    }
  }
}
