import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.swagger.dart';

part 'get_organizations_list_state.dart';

class GetOrganizationsListCubit extends Cubit<GetOrganizationsListState> {
  final ApiClient apiClient;

  GetOrganizationsListCubit(this.apiClient)
      : super(GetOrganizationsListInitial());

  getOrganizationsList() async {
    emit(GetOrganizationsListLoading());

    try {
      final data = apiClient.handleResponse<List<OrganizationDto>>(
        await apiClient.api.apiOrganizationsGetListGet(
          maxResultCount: 1000000,
        ),
      );

      if (data.isEmpty) {
        emit(GetOrganizationsListEmpty());
      } else {
        emit(GetOrganizationsListSuccess(data));
      }
    } catch (error) {
      emit(GetOrganizationsListError(error));
    }
  }


  void updateItemInternally(OrganizationDto itemDto) {
    if (state is GetOrganizationsListSuccess) {
      final data = (state as GetOrganizationsListSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetOrganizationsListSuccess(data));
    }
  }

  void addItemInternally(OrganizationDto itemDto) {
    List<OrganizationDto> data = [];

    if (state is GetOrganizationsListSuccess) {
      data = (state as GetOrganizationsListSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetOrganizationsListSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetOrganizationsListSuccess) {
      final data = (state as GetOrganizationsListSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetOrganizationsListSuccess(data));
    }
  }
}
