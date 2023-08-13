import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_program_photo_state.dart';

class DeleteProgramPhotoCubit extends Cubit<DeleteProgramPhotoState> {
  final ApiClient apiClient;

  DeleteProgramPhotoCubit(this.apiClient) : super(DeleteProgramPhotoInitial());

  Future<void> deleteProgramPhoto(int id) async {
    emit(DeleteProgramPhotoLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramGalleryPhotoDto>(
        await apiClient.api.apiVolunteerProgramGalleryPhotosDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteProgramPhotoSuccess(data));
    } catch (error) {
      emit(DeleteProgramPhotoError(error));
    }
  }
}
