part of 'update_skill_cubit.dart';

@immutable
abstract class UpdateSkillState {}

class UpdateSkillInitial extends UpdateSkillState {}

class UpdateSkillLoading extends UpdateSkillState {}

class UpdateSkillError extends UpdateSkillState {
  final dynamic error;

  UpdateSkillError(this.error);
}

class UpdateSkillSuccess extends UpdateSkillState {
  final SkillDto data;

  UpdateSkillSuccess(this.data);
}
