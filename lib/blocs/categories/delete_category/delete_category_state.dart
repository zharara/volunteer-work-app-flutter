part of 'delete_category_cubit.dart';

@immutable
abstract class DeleteCategoryState {}

class DeleteCategoryInitial extends DeleteCategoryState {}

class DeleteCategoryLoading extends DeleteCategoryState {}

class DeleteCategoryError extends DeleteCategoryState {
  final dynamic error;

  DeleteCategoryError(this.error);
}

class DeleteCategorySuccess extends DeleteCategoryState {
  final CategoryDto data;

  DeleteCategorySuccess(this.data);
}
