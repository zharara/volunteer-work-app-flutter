import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'create_management_announcement_state.dart';

class CreateManagementAnnouncementCubit
    extends Cubit<CreateManagementAnnouncementState> {
  final ApiClient apiClient;

  CreateManagementAnnouncementCubit(this.apiClient)
      : super(CreateManagementAnnouncementInitial());

  Future<void> createManagementAnnouncement(
      {required String title,
      required String description,
      SaveTempFile? saveTempFile}) async {
    emit(CreateManagementAnnouncementLoading());

    try {
      final data = apiClient.handleResponse<AnnouncementDto>(
        await apiClient.api.apiAnnouncementsCreatePost(
          body: CreateAnnouncementDto(
            title: title,
            description: description,
            saveTempFile: saveTempFile,
            isManagementAnnouncement: true,
            isOrganizationAnnouncement: false,
          ),
        ),
      );

      emit(CreateManagementAnnouncementSuccess(data));
    } catch (error) {
      emit(CreateManagementAnnouncementError(error));
    }
  }
}
