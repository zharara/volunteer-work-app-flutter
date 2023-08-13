import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_announcement_state.dart';

class DeleteAnnouncementCubit extends Cubit<DeleteAnnouncementState> {
  final ApiClient apiClient;

  DeleteAnnouncementCubit(this.apiClient) : super(DeleteAnnouncementInitial());

  Future<void> deleteAnnouncement(int id) async {
    emit(DeleteAnnouncementLoading());

    try {
      final data = apiClient.handleResponse<AnnouncementDto>(
        await apiClient.api.apiAnnouncementsDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteAnnouncementSuccess(data));
    } catch (error) {
      emit(DeleteAnnouncementError(error));
    }
  }
}
