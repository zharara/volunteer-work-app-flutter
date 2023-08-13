part of 'create_category_cubit.dart';

@immutable
abstract class CreateCategoryState {}

class CreateCategoryInitial extends CreateCategoryState {}

class CreateCategoryLoading extends CreateCategoryState {}

class CreateCategoryError extends CreateCategoryState {
  final dynamic error;

  CreateCategoryError(this.error);
}

class CreateCategorySuccess extends CreateCategoryState {
  final CategoryDto data;

  CreateCategorySuccess(this.data);
}
