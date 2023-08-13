import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_all_opportunities_state.dart';

class GetAllOpportunitiesCubit extends Cubit<GetAllOpportunitiesState> {
  final ApiClient apiClient;

  GetAllOpportunitiesCubit(this.apiClient)
      : super(GetAllOpportunitiesInitial());

 Future<void> getAllOpportunities({String? filter, int? organizationId}) async {
    emit(GetAllOpportunitiesLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerOpportunityDto>>(
        await apiClient.api.apiVolunteerOpportunitiesGetListGet(
          maxResultCount: 1000000,
        ),
      );

      if (data.isEmpty) {
        emit(GetAllOpportunitiesEmpty());
      } else {
        emit(GetAllOpportunitiesSuccess(data));
      }
    } catch (error) {
      emit(GetAllOpportunitiesError(error));
    }
  }


  void updateItemInternally(VolunteerOpportunityDto itemDto) {
    if (state is GetAllOpportunitiesSuccess) {
      final data = (state as GetAllOpportunitiesSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetAllOpportunitiesSuccess(data));
    }
  }

  void addItemInternally(VolunteerOpportunityDto itemDto) {
    List<VolunteerOpportunityDto> data = [];

    if (state is GetAllOpportunitiesSuccess) {
      data = (state as GetAllOpportunitiesSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAllOpportunitiesSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAllOpportunitiesSuccess) {
      final data = (state as GetAllOpportunitiesSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllOpportunitiesSuccess(data));
    }
  }
}
