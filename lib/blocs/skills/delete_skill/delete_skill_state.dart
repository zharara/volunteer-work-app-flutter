part of 'delete_skill_cubit.dart';

@immutable
abstract class DeleteSkillState {}

class DeleteSkillInitial extends DeleteSkillState {}

class DeleteSkillLoading extends DeleteSkillState {}

class DeleteSkillError extends DeleteSkillState {
  final dynamic error;

  DeleteSkillError(this.error);
}

class DeleteSkillSuccess extends DeleteSkillState {
  final SkillDto data;

  DeleteSkillSuccess(this.data);
}
