import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_program_photo_state.dart';

class CreateProgramPhotoCubit
    extends Cubit<CreateProgramPhotoState> {
  final ApiClient apiClient;

  CreateProgramPhotoCubit(this.apiClient)
      : super(CreateProgramPhotoInitial());

  Future<void> createProgramPhoto(
      CreateGalleryPhotoDto body) async {
    emit(CreateProgramPhotoLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramGalleryPhotoDto>(
        await apiClient.api.apiVolunteerProgramGalleryPhotosCreatePost(
          body: body,
        ),
      );

      emit(CreateProgramPhotoSuccess(data));
    } catch (error) {
      emit(CreateProgramPhotoError(error));
    }
  }
}
