import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_organization_opportunities_state.dart';

class GetOrganizationOpportunitiesCubit
    extends Cubit<GetOrganizationOpportunitiesState> {
  final ApiClient apiClient;

  GetOrganizationOpportunitiesCubit(this.apiClient)
      : super(GetOrganizationOpportunitiesInitial());

  getOrganizationOpportunities(int organizationId) async {
    emit(GetOrganizationOpportunitiesLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerOpportunityDto>>(
        await apiClient.api.apiVolunteerOpportunitiesGetListGet(
          organizationId: organizationId,
        ),
      );

      if (data.isEmpty) {
        emit(GetOrganizationOpportunitiesEmpty());
      } else {
        emit(GetOrganizationOpportunitiesSuccess(data));
      }
    } catch (error) {
      emit(GetOrganizationOpportunitiesError(error));
    }
  }


  void updateItemInternally(VolunteerOpportunityDto itemDto) {
    if (state is GetOrganizationOpportunitiesSuccess) {
      final data = (state as GetOrganizationOpportunitiesSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetOrganizationOpportunitiesSuccess(data));
    }
  }

  void addItemInternally(VolunteerOpportunityDto itemDto) {
    List<VolunteerOpportunityDto> data = [];

    if (state is GetOrganizationOpportunitiesSuccess) {
      data = (state as GetOrganizationOpportunitiesSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetOrganizationOpportunitiesSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetOrganizationOpportunitiesSuccess) {
      final data = (state as GetOrganizationOpportunitiesSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetOrganizationOpportunitiesSuccess(data));
    }
  }
}
