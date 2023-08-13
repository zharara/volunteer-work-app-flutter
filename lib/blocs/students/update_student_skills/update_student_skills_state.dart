part of 'update_student_skills_cubit.dart';

@immutable
abstract class UpdateStudentSkillsState {}

class UpdateStudentSkillsInitial extends UpdateStudentSkillsState {}

class UpdateStudentSkillsLoading extends UpdateStudentSkillsState {}

class UpdateStudentSkillsSuccess extends UpdateStudentSkillsState {
  final StudentDto data;

  UpdateStudentSkillsSuccess(this.data);
}

class UpdateStudentSkillsError extends UpdateStudentSkillsState {
  final dynamic error;

  UpdateStudentSkillsError(this.error);
}