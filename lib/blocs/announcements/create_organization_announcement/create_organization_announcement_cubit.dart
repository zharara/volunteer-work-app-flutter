import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/main.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'create_organization_announcement_state.dart';

class CreateOrganizationAnnouncementCubit
    extends Cubit<CreateOrganizationAnnouncementState> {
  final ApiClient apiClient;

  CreateOrganizationAnnouncementCubit(this.apiClient)
      : super(CreateOrganizationAnnouncementInitial());

  Future<void> createOrganizationAnnouncement(
      {required String title,
      required String description,
      SaveTempFile? saveTempFile,
      required int volunteerProgramId}) async {
    emit(CreateOrganizationAnnouncementLoading());

    try {
      final data = apiClient.handleResponse<AnnouncementDto>(
        await apiClient.api.apiAnnouncementsCreatePost(
          body: CreateAnnouncementDto(
            title: title,
            description: description,
            saveTempFile: saveTempFile,
            isManagementAnnouncement: false,
            isOrganizationAnnouncement: true,
            organizationId: globalAppStorage.getOrganizationAccount()?.id ?? 0,
            volunteerProgramId: volunteerProgramId,
          ),
        ),
      );

      emit(CreateOrganizationAnnouncementSuccess(data));
    } catch (error) {
      emit(CreateOrganizationAnnouncementError(error));
    }
  }
}
