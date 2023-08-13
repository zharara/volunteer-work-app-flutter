part of 'edit_category_cubit.dart';

@immutable
abstract class EditCategoryState {}

class EditCategoryInitial extends EditCategoryState {}

class EditCategoryLoading extends EditCategoryState {}

class EditCategoryError extends EditCategoryState {
  final dynamic error;

  EditCategoryError(this.error);
}

class EditCategorySuccess extends EditCategoryState {
  final CategoryDto data;

  EditCategorySuccess(this.data);
}
