import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_all_student_accounts_state.dart';

class GetAllStudentAccountsCubit extends Cubit<GetAllStudentAccountsState> {
  final ApiClient apiClient;

  GetAllStudentAccountsCubit(this.apiClient)
      : super(GetAllStudentAccountsInitial());

  void getAllStudentAccounts() async {
    emit(GetAllStudentAccountsLoading());

    try {
      final data = apiClient.handleResponse<List<StudentDto>>(
        await apiClient.api.apiStudentsGetAllGet(),
      );

      if (data.isEmpty) {
        emit(GetAllStudentAccountsEmpty());
      } else {
        emit(GetAllStudentAccountsSuccess(data));
      }
    } catch (error) {
      emit(GetAllStudentAccountsError(error));
    }
  }

  void updateItemInternally(StudentDto itemDto) {
    if (state is GetAllStudentAccountsSuccess) {
      final data = (state as GetAllStudentAccountsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetAllStudentAccountsSuccess(data));
    }
  }

  void addItemInternally(StudentDto itemDto) {
    List<StudentDto> data = [];

    if (state is GetAllStudentAccountsSuccess) {
      data = (state as GetAllStudentAccountsSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAllStudentAccountsSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAllStudentAccountsSuccess) {
      final data = (state as GetAllStudentAccountsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllStudentAccountsSuccess(data));
    }
  }
}
