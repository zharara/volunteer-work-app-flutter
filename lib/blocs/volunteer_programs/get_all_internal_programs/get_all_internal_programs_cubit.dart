import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_all_internal_programs_state.dart';

class GetAllInternalProgramsCubit extends Cubit<GetAllInternalProgramsState> {
  final ApiClient apiClient;

  GetAllInternalProgramsCubit(this.apiClient)
      : super(GetAllInternalProgramsInitial());

  void getAllInternalPrograms() async {
    emit(GetAllInternalProgramsLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerProgramDto>>(
        await apiClient.api.apiVolunteerProgramsGetListGet(
          isInternalProgram: true,
          maxResultCount: 1000000,
        ),
      );

      if (data.isEmpty) {
        emit(GetAllInternalProgramsEmpty());
      } else {
        emit(GetAllInternalProgramsSuccess(data));
      }
    } catch (error) {
      emit(GetAllInternalProgramsError(error));
    }
  }

  void updateItemInternally(VolunteerProgramDto itemDto) {
    if (state is GetAllInternalProgramsSuccess) {
      final data = (state as GetAllInternalProgramsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetAllInternalProgramsSuccess(data));
    }
  }

  void addItemInternally(VolunteerProgramDto itemDto) {
    List<VolunteerProgramDto> data = [];

    if (state is GetAllInternalProgramsSuccess) {
      data = (state as GetAllInternalProgramsSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAllInternalProgramsSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAllInternalProgramsSuccess) {
      final data = (state as GetAllInternalProgramsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllInternalProgramsSuccess(data));
    }
  }
}
