
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_category_state.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  final ApiClient apiClient;

  CreateCategoryCubit(this.apiClient) : super(CreateCategoryInitial());

  Future<void> createCategory({required String name}) async {
    emit(CreateCategoryLoading());

    try {
      final data = apiClient.handleResponse<CategoryDto>(await apiClient.api
          .apiCategoriesCreatePost(body: CreateCategoryDto(name: name)));

      emit(CreateCategorySuccess(data));
    } catch (error) {
      emit(CreateCategoryError(error));
    }
  }
}
