import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_organization_announcements_state.dart';

class GetOrganizationAnnouncementsCubit
    extends Cubit<GetOrganizationAnnouncementsState> {
  final ApiClient apiClient;

  GetOrganizationAnnouncementsCubit(this.apiClient)
      : super(GetOrganizationAnnouncementsInitial());

  Future<void> getOrganizationAnnouncements({
    required int organizationId,
}) async {
    emit(GetOrganizationAnnouncementsLoading());

    try {
      final data = apiClient.handleResponse<List<AnnouncementDto>>(
          await apiClient.api.apiAnnouncementsGetListGet(
        isOrganizationAnnouncment: true,
        organizationId: organizationId,
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetOrganizationAnnouncementsEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetOrganizationAnnouncementsSuccess(data));
      }
    } catch (error) {
      emit(GetOrganizationAnnouncementsError(error));
    }
  }

  void updateItemInternally(AnnouncementDto itemDto) {
    if (state is GetOrganizationAnnouncementsSuccess) {
      final data = (state as GetOrganizationAnnouncementsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetOrganizationAnnouncementsSuccess(data));
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetOrganizationAnnouncementsSuccess) {
      final data = (state as GetOrganizationAnnouncementsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetOrganizationAnnouncementsSuccess(data));
    }
  }
}
