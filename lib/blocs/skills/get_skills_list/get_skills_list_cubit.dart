import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_skills_list_state.dart';

class GetSkillsListCubit extends Cubit<GetSkillsListState> {
  final ApiClient apiClient;

  GetSkillsListCubit(this.apiClient) : super(GetSkillsListInitial());

  getSkillsList() async {
    emit(GetSkillsListLoading());

    try {
      final data = apiClient.handleResponse<List<SkillDto>>(
        await apiClient.api.apiSkillsGetListGet(),
      );

      if (data.isEmpty) {
        emit(GetSkillsListEmpty());
      } else {
        emit(GetSkillsListSuccess(data));
      }
    } catch (error) {
      emit(GetSkillsListError(error));
    }
  }


  void updateItemInternally(SkillDto itemDto) {
    if (state is GetSkillsListSuccess) {
      final data = (state as GetSkillsListSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetSkillsListSuccess(data));
    }
  }

  void addItemInternally(SkillDto itemDto) {
    List<SkillDto> data = [];

    if (state is GetSkillsListSuccess) {
      data = (state as GetSkillsListSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetSkillsListSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetSkillsListSuccess) {
      final data = (state as GetSkillsListSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetSkillsListSuccess(data));
    }
  }
}
