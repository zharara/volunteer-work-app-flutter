part of 'get_home_applications_cubit.dart';

@immutable
abstract class GetHomeApplicationsState {}

class GetHomeApplicationsInitial extends GetHomeApplicationsState {}

class GetHomeApplicationsLoading extends GetHomeApplicationsState {}

class GetHomeApplicationsError extends GetHomeApplicationsState {
  final dynamic error;

  GetHomeApplicationsError(this.error);
}

class GetHomeApplicationsEmpty extends GetHomeApplicationsState {}

class GetHomeApplicationsSuccess extends GetHomeApplicationsState {
  final List<StudentApplicationDto> data;

  GetHomeApplicationsSuccess(this.data);
}