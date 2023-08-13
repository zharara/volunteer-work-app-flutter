import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_all_organizations_programs_state.dart';

class GetAllOrganizationsProgramsCubit
    extends Cubit<GetAllOrganizationsProgramsState> {
  final ApiClient apiClient;

  GetAllOrganizationsProgramsCubit(this.apiClient)
      : super(GetAllOrganizationsProgramsInitial());

  void getAllOrganizationsPrograms() async {
    emit(GetAllOrganizationsProgramsLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerProgramDto>>(
        await apiClient.api.apiVolunteerProgramsGetListGet(
          isInternalProgram: false,
          maxResultCount: 1000000,
        ),
      );

      if (data.isEmpty) {
        emit(GetAllOrganizationsProgramsEmpty());
      } else {
        emit(GetAllOrganizationsProgramsSuccess(data));
      }
    } catch (error) {
      emit(GetAllOrganizationsProgramsError(error));
    }
  }


  void updateItemInternally(VolunteerProgramDto itemDto) {
    if (state is GetAllOrganizationsProgramsSuccess) {
      final data = (state as GetAllOrganizationsProgramsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetAllOrganizationsProgramsSuccess(data));
    }
  }

  void addItemInternally(VolunteerProgramDto itemDto) {
    List<VolunteerProgramDto> data = [];

    if (state is GetAllOrganizationsProgramsSuccess) {
      data = (state as GetAllOrganizationsProgramsSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAllOrganizationsProgramsSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAllOrganizationsProgramsSuccess) {
      final data = (state as GetAllOrganizationsProgramsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllOrganizationsProgramsSuccess(data));
    }
  }
}
