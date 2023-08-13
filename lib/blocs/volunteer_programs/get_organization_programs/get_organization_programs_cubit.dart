import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_organization_programs_state.dart';

class GetOrganizationProgramsCubit extends Cubit<GetOrganizationProgramsState> {
  final ApiClient apiClient;

  GetOrganizationProgramsCubit(this.apiClient)
      : super(GetOrganizationProgramsInitial());

  void getOrganizationPrograms({required int organizationId}) async {
    emit(GetOrganizationProgramsLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerProgramDto>>(
        await apiClient.api.apiVolunteerProgramsGetListGet(
          organizationId: organizationId ,
        ),
      );

      if (data.isEmpty) {
        emit(GetOrganizationProgramsEmpty());
      } else {
        emit(GetOrganizationProgramsSuccess(data));
      }
    } catch (error) {
      emit(GetOrganizationProgramsError(error));
    }
  }


  void updateItemInternally(VolunteerProgramDto itemDto) {
    if (state is GetOrganizationProgramsSuccess) {
      final data = (state as GetOrganizationProgramsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetOrganizationProgramsSuccess(data));
    }
  }

  void addItemInternally(VolunteerProgramDto itemDto) {
    List<VolunteerProgramDto> data = [];

    if (state is GetOrganizationProgramsSuccess) {
      data = (state as GetOrganizationProgramsSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetOrganizationProgramsSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetOrganizationProgramsSuccess) {
      final data = (state as GetOrganizationProgramsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetOrganizationProgramsSuccess(data));
    }
  }
}
