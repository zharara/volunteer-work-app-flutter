import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  final ApiClient apiClient;

  DeleteCategoryCubit(this.apiClient) : super(DeleteCategoryInitial());

  void resetState(){
    emit(DeleteCategoryInitial());
  }

  Future<void> deleteCategory({required int id}) async {
    emit(DeleteCategoryLoading());

    try {
      final data = apiClient.handleResponse<CategoryDto>(
          await apiClient.api.apiCategoriesDeleteIdDelete(id: id));

      emit(DeleteCategorySuccess(data));
    } catch (error) {
      emit(DeleteCategoryError(error));
    }
  }
}
