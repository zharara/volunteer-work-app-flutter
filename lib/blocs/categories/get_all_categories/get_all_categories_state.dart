part of 'get_all_categories_cubit.dart';

@immutable
abstract class GetAllCategoriesState {}

class GetAllCategoriesInitial extends GetAllCategoriesState {}

class GetAllCategoriesLoading extends GetAllCategoriesState {}

class GetAllCategoriesError extends GetAllCategoriesState {
  final dynamic error;

  GetAllCategoriesError(this.error);
}

class GetAllCategoriesEmpty extends GetAllCategoriesState {}

class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final List<CategoryDto> data;

  GetAllCategoriesSuccess(this.data);
}
