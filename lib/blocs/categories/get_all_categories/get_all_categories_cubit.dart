import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  final ApiClient apiClient;

  GetAllCategoriesCubit(this.apiClient) : super(GetAllCategoriesInitial());

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoading());

    try {
      final data = apiClient.handleResponse<List<CategoryDto>>(
          await apiClient.api.apiCategoriesGetAllGet());

      if (data.isEmpty) {
        emit(GetAllCategoriesEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetAllCategoriesSuccess(data));
      }
    } catch (error) {
      emit(GetAllCategoriesError(error));
    }
  }

  void updateItemInternally(CategoryDto categoryDto) {
    if (state is GetAllCategoriesSuccess) {
      final data = (state as GetAllCategoriesSuccess).data;
      int index = data.indexWhere((e) => e.id == categoryDto.id);
      data[index] = categoryDto;
      emit(GetAllCategoriesSuccess(data));
    }
  }

  void addItemInternally(CategoryDto itemDto) {
    List<CategoryDto> data = [];

    if (state is GetAllCategoriesSuccess) {
      data = (state as GetAllCategoriesSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAllCategoriesSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAllCategoriesSuccess) {
      final data = (state as GetAllCategoriesSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllCategoriesSuccess(data));
    }
  }
}
