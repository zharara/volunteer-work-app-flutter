import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_opportunity_state.dart';

class DeleteOpportunityCubit extends Cubit<DeleteOpportunityState> {
  final ApiClient apiClient;

  DeleteOpportunityCubit(this.apiClient) : super(DeleteOpportunityInitial());

  void resetState(){
    emit(DeleteOpportunityInitial());
  }

  deleteOpportunity(int id) async {
    emit(DeleteOpportunityLoading());

    try {
      final data = apiClient.handleResponse<VolunteerOpportunityDto>(
        await apiClient.api.apiVolunteerOpportunitiesDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteOpportunitySuccess(data));
    } catch (error) {
      emit(DeleteOpportunityError(error));
    }
  }
}
