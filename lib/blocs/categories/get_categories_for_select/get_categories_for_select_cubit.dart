import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_categories_for_select_state.dart';

class GetCategoriesForSelectCubit extends Cubit<GetCategoriesForSelectState> {
  final ApiClient apiClient;

  GetCategoriesForSelectCubit(this.apiClient)
      : super(GetCategoriesForSelectInitial());

  Future<void> getCategories() async {
    emit(GetCategoriesForSelectLoading());

    try {
      final data = apiClient.handleResponse<List<CategoryDto>>(
          await apiClient.api.apiCategoriesGetAllGet());

      if (data.isEmpty) {
        emit(GetCategoriesForSelectEmpty());
      } else {
        emit(GetCategoriesForSelectSuccess(data));
      }
    } catch (error) {
      emit(GetCategoriesForSelectError(error));
    }
  }
}
