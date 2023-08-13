import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_program_announcements_state.dart';

class GetProgramAnnouncementsCubit extends Cubit<GetProgramAnnouncementsState> {
  final ApiClient apiClient;

  GetProgramAnnouncementsCubit(this.apiClient)
      : super(GetProgramAnnouncementsInitial());

  Future<void> getProgramAnnouncements(
      {required int volunteerProgramId}) async {
    emit(GetProgramAnnouncementsLoading());

    try {
      final data = apiClient.handleResponse<List<AnnouncementDto>>(
          await apiClient.api.apiAnnouncementsGetListGet(
        isOrganizationAnnouncment: true,
        volunteerProgramId: volunteerProgramId,
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetProgramAnnouncementsEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetProgramAnnouncementsSuccess(data));
      }
    } catch (error) {
      emit(GetProgramAnnouncementsError(error));
    }
  }

  void updateItemInternally(AnnouncementDto itemDto) {
    if (state is GetProgramAnnouncementsSuccess) {
      final data = (state as GetProgramAnnouncementsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetProgramAnnouncementsSuccess(data));
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetProgramAnnouncementsSuccess) {
      final data = (state as GetProgramAnnouncementsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetProgramAnnouncementsSuccess(data));
    }
  }
}
