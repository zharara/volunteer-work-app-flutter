part of 'get_skills_list_cubit.dart';

@immutable
abstract class GetSkillsListState {}

class GetSkillsListInitial extends GetSkillsListState {}

class GetSkillsListLoading extends GetSkillsListState {}

class GetSkillsListEmpty extends GetSkillsListState {}

class GetSkillsListError extends GetSkillsListState {
  final dynamic error;

  GetSkillsListError(this.error);
}

class GetSkillsListSuccess extends GetSkillsListState {
  final List<SkillDto> data;

  GetSkillsListSuccess(this.data);
}
