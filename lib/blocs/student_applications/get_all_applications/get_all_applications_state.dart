part of 'get_all_applications_cubit.dart';

@immutable
abstract class GetAllApplicationsState {}

class GetAllApplicationsInitial extends GetAllApplicationsState {}

class GetAllApplicationsLoading extends GetAllApplicationsState {}

class GetAllApplicationsError extends GetAllApplicationsState {
  final dynamic error;

  GetAllApplicationsError(this.error);
}

class GetAllApplicationsEmpty extends GetAllApplicationsState {}

class GetAllApplicationsSuccess extends GetAllApplicationsState {
  final List<StudentApplicationDto> data;

  GetAllApplicationsSuccess(this.data);
}
