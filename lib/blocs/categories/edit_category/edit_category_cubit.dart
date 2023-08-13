

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  final ApiClient apiClient;

  EditCategoryCubit(this.apiClient) : super(EditCategoryInitial());

  Future<void> editCategory(
      {required CategoryDto categoryDto, required String newName}) async {
    emit(EditCategoryLoading());

    try {
      final data = apiClient.handleResponse<CategoryDto>(await apiClient.api
          .apiCategoriesUpdatePut(
              body: UpdateCategoryDto(id: categoryDto.id!, name: newName)));

      emit(EditCategorySuccess(data));
    } catch (error) {
      emit(EditCategoryError(error));
    }
  }
}
