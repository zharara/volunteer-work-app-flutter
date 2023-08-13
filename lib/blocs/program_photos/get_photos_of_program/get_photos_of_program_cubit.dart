import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_photos_of_program_state.dart';

class GetPhotosOfProgramCubit extends Cubit<GetPhotosOfProgramState> {
  final ApiClient apiClient;

  GetPhotosOfProgramCubit(this.apiClient) : super(GetPhotosOfProgramInitial());

  void resetState(){
    emit(GetPhotosOfProgramInitial());
  }

  Future<void> getPhotosOfProgram({required int programId}) async {
    emit(GetPhotosOfProgramLoading());

    try {
      final data =
          apiClient.handleResponse<List<VolunteerProgramGalleryPhotoDto>>(
              await apiClient.api.apiVolunteerProgramGalleryPhotosGetListGet(
        volunteerProgramId: programId,
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetPhotosOfProgramEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetPhotosOfProgramSuccess(data));
      }
    } catch (error) {
      emit(GetPhotosOfProgramError(error));
    }
  }

  void updateItemInternally(VolunteerProgramGalleryPhotoDto itemDto) {
    if (state is GetPhotosOfProgramSuccess) {
      final data = (state as GetPhotosOfProgramSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetPhotosOfProgramSuccess(data));
    }
  }

  void addItemInternally(VolunteerProgramGalleryPhotoDto itemDto) {
    List<VolunteerProgramGalleryPhotoDto> data = [];

    if (state is GetPhotosOfProgramSuccess) {
      data = (state as GetPhotosOfProgramSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetPhotosOfProgramSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetPhotosOfProgramSuccess) {
      final data = (state as GetPhotosOfProgramSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetPhotosOfProgramSuccess(data));
    }
  }
}
