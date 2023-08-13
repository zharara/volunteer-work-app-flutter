import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_management_announcements_state.dart';

class GetManagementAnnouncementsCubit
    extends Cubit<GetManagementAnnouncementsState> {
  final ApiClient apiClient;

  GetManagementAnnouncementsCubit(this.apiClient)
      : super(GetManagementAnnouncementsInitial());

  Future<void> getManagementAnnouncements() async {
    emit(GetManagementAnnouncementsLoading());

    try {
      final data = apiClient.handleResponse<List<AnnouncementDto>>(
          await apiClient.api.apiAnnouncementsGetListGet(
        isManagementAnnouncment: true,
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetManagementAnnouncementsEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetManagementAnnouncementsSuccess(data));
      }
    } catch (error) {
      emit(GetManagementAnnouncementsError(error));
    }
  }

  void updateItemInternally(AnnouncementDto itemDto) {
    if (state is GetManagementAnnouncementsSuccess) {
      final data = (state as GetManagementAnnouncementsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetManagementAnnouncementsSuccess(data));
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetManagementAnnouncementsSuccess) {
      final data = (state as GetManagementAnnouncementsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetManagementAnnouncementsSuccess(data));
    }
  }
}
