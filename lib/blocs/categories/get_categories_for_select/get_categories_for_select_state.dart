part of 'get_categories_for_select_cubit.dart';

@immutable
abstract class GetCategoriesForSelectState {}

class GetCategoriesForSelectInitial extends GetCategoriesForSelectState {}

class GetCategoriesForSelectLoading extends GetCategoriesForSelectState {}

class GetCategoriesForSelectError extends GetCategoriesForSelectState {
  final dynamic error;

  GetCategoriesForSelectError(this.error);
}

class GetCategoriesForSelectEmpty extends GetCategoriesForSelectState {}

class GetCategoriesForSelectSuccess extends GetCategoriesForSelectState {
  final List<CategoryDto> data;

  GetCategoriesForSelectSuccess(this.data);
}
