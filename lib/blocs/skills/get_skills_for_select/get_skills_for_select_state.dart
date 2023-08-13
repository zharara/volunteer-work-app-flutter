part of 'get_skills_for_select_cubit.dart';

@immutable
abstract class GetSkillsForSelectState {}

class GetSkillsForSelectInitial extends GetSkillsForSelectState {}

class GetSkillsForSelectLoading extends GetSkillsForSelectState {}

class GetSkillsForSelectEmpty extends GetSkillsForSelectState {}

class GetSkillsForSelectError extends GetSkillsForSelectState {
  final dynamic error;

  GetSkillsForSelectError(this.error);
}

class GetSkillsForSelectSuccess extends GetSkillsForSelectState {
  final List<SkillDto> data;

  GetSkillsForSelectSuccess(this.data);
}
