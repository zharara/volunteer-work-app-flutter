import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_organization_announcement_state.dart';

class UpdateOrganizationAnnouncementCubit extends Cubit<UpdateOrganizationAnnouncementState> {
  final ApiClient apiClient;

  UpdateOrganizationAnnouncementCubit(this.apiClient)
      : super(UpdateOrganizationAnnouncementInitial());

  Future<void> updateOrganizationAnnouncement(
      {required int announcementId,
        required String title,
        required String description,
        SaveTempFile? saveTempFile}) async {
    emit(UpdateOrganizationAnnouncementLoading());

    try {
      final data = apiClient.handleResponse<AnnouncementDto>(
        await apiClient.api.apiAnnouncementsUpdatePut(
          body: UpdateAnnouncementDto(
            id: announcementId,
            title: title,
            description: description,
            saveTempFile: saveTempFile,
          ),
        ),
      );

      emit(UpdateOrganizationAnnouncementSuccess(data));
    } catch (error) {
      emit(UpdateOrganizationAnnouncementError(error));
    }
  }}
