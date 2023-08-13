import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_opportunity_state.dart';

class UpdateOpportunityCubit extends Cubit<UpdateOpportunityState> {
  final ApiClient apiClient;

  UpdateOpportunityCubit(this.apiClient) : super(UpdateOpportunityInitial());

  Future<void> updateOpportunity(UpdateVolunteerOpportunityDto body) async {
    emit(UpdateOpportunityLoading());

    try {
      final data = apiClient.handleResponse<VolunteerOpportunityDto>(
        await apiClient.api.apiVolunteerOpportunitiesUpdatePut(
          body: body,
        ),
      );

      emit(UpdateOpportunitySuccess(data));
    } catch (error) {
      emit(UpdateOpportunityError(error));
    }
  }
}
