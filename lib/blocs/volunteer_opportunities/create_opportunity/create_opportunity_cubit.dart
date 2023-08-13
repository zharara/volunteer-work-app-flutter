import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'create_opportunity_state.dart';

class CreateOpportunityCubit extends Cubit<CreateOpportunityState> {
  final ApiClient apiClient;

  CreateOpportunityCubit(this.apiClient) : super(CreateOpportunityInitial());

  createOpportunity(CreateVolunteerOpportunityDto body) async {
    emit(CreateOpportunityLoading());

    try {
      final data = apiClient.handleResponse<VolunteerOpportunityDto>(
        await apiClient.api.apiVolunteerOpportunitiesCreatePost(
          body: body,
        ),
      );

      emit(CreateOpportunitySuccess(data));
    } catch (error) {
      emit(CreateOpportunityError(error));
    }
  }
}
