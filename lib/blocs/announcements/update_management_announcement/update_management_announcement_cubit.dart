import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_management_announcement_state.dart';

class UpdateManagementAnnouncementCubit
    extends Cubit<UpdateManagementAnnouncementState> {
  final ApiClient apiClient;

  UpdateManagementAnnouncementCubit(this.apiClient)
      : super(UpdateManagementAnnouncementInitial());

  Future<void> updateManagementAnnouncement(
      {required int announcementId,
      required String title,
      required String description,
      SaveTempFile? saveTempFile}) async {
    emit(UpdateManagementAnnouncementLoading());

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

      emit(UpdateManagementAnnouncementSuccess(data));
    } catch (error) {
      emit(UpdateManagementAnnouncementError(error));
    }
  }
}
