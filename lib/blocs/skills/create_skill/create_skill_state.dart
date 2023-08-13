part of 'create_skill_cubit.dart';

@immutable
abstract class CreateSkillState {}

class CreateSkillInitial extends CreateSkillState {}

class CreateSkillLoading extends CreateSkillState {}

class CreateSkillError extends CreateSkillState {
  final dynamic error;

  CreateSkillError(this.error);
}

class CreateSkillSuccess extends CreateSkillState {
  final SkillDto data;

  CreateSkillSuccess(this.data);
}
