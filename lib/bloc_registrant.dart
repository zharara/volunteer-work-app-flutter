import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/announcements/create_management_announcement/create_management_announcement_cubit.dart';
import 'package:volunteer_work_app/blocs/announcements/create_organization_announcement/create_organization_announcement_cubit.dart';
import 'package:volunteer_work_app/blocs/announcements/delete_announcement/delete_announcement_cubit.dart';
import 'package:volunteer_work_app/blocs/announcements/get_management_announcements/get_management_announcements_cubit.dart';
import 'package:volunteer_work_app/blocs/announcements/get_organization_announcements/get_organization_announcements_cubit.dart';
import 'package:volunteer_work_app/blocs/announcements/update_management_announcement/update_management_announcement_cubit.dart';
import 'package:volunteer_work_app/blocs/announcements/update_organization_announcement/update_organization_announcement_cubit.dart';
import 'package:volunteer_work_app/blocs/auth/login/login_bloc.dart';
import 'package:volunteer_work_app/blocs/auth/management_reset_student_password/management_reset_student_password_cubit.dart';
import 'package:volunteer_work_app/blocs/auth/reset_password/reset_password_cubit.dart';
import 'package:volunteer_work_app/blocs/categories/create_category/create_category_cubit.dart';
import 'package:volunteer_work_app/blocs/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:volunteer_work_app/blocs/management_employees/create_management_account/create_management_account_cubit.dart';
import 'package:volunteer_work_app/blocs/management_employees/get_all_management_accounts/get_all_management_accounts_cubit.dart';
import 'package:volunteer_work_app/blocs/management_employees/get_management_employee_by_id/get_management_employee_by_id_cubit.dart';
import 'package:volunteer_work_app/blocs/messages/create_message/create_message_cubit.dart';
import 'package:volunteer_work_app/blocs/messages/delete_message/delete_message_cubit.dart';
import 'package:volunteer_work_app/blocs/messages/get_conversation_messages/get_conversation_messages_cubit.dart';
import 'package:volunteer_work_app/blocs/organizations/get_organization_by_id/get_organization_by_id_cubit.dart';
import 'package:volunteer_work_app/blocs/organizations/get_organizations_for_home/get_organizations_for_home_cubit.dart';
import 'package:volunteer_work_app/blocs/organizations/get_organizations_list/get_organizations_list_cubit.dart';
import 'package:volunteer_work_app/blocs/organizations/update_organization_profile/update_organization_profile_cubit.dart';
import 'package:volunteer_work_app/blocs/program_photos/delete_program_photo/delete_program_photo_cubit.dart';
import 'package:volunteer_work_app/blocs/program_tasks/get_tasks_of_program/get_tasks_of_program_cubit.dart';
import 'package:volunteer_work_app/blocs/skills/delete_skill/delete_skill_cubit.dart';
import 'package:volunteer_work_app/blocs/skills/update_skill/update_skill_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_all_applications/get_all_applications_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_for_opportunity/get_applications_for_opportunity_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_for_organization/get_applications_for_organization_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_of_student/get_applications_of_student_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/management_accept_application/management_accept_application_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/management_reject_application/management_reject_application_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/organization_accept_application/organization_accept_application_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/organization_reject_application/organization_reject_application_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/update_student_application/update_student_application_cubit.dart';
import 'package:volunteer_work_app/blocs/students/get_all_students_accounts/get_all_student_accounts_cubit.dart';
import 'package:volunteer_work_app/blocs/students/get_not_volunteer_students/get_not_volunteer_students_cubit.dart';
import 'package:volunteer_work_app/blocs/students/update_student_account/update_student_account_cubit.dart';
import 'package:volunteer_work_app/blocs/students/update_student_by_management/update_student_by_management_cubit.dart';
import 'package:volunteer_work_app/blocs/students/update_student_skills/update_student_skills_cubit.dart';
import 'package:volunteer_work_app/blocs/task_accomplishes/delete_task_accomplish/delete_task_accomplish_cubit.dart';
import 'package:volunteer_work_app/blocs/task_accomplishes/get_task_accomplishes_of_volunteer/get_task_accomplishes_of_volunteer_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/create_opportunity/create_opportunity_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/get_all_opportunities/get_all_opportunities_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/update_opportunity/update_opportunity_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_programs/get_organization_programs/get_organization_programs_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/change_volunteer_grade/change_volunteer_grade_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/delete_volunteer/delete_volunteer_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_all_volunteers/get_all_volunteers_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteer_by_student_id/get_volunteer_by_student_id_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_students/get_volunteers_of_organization/get_volunteers_of_organization_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/change_work_day_attendance/change_work_day_attendance_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/delete_work_day_attendance/delete_work_day_attendance_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/get_work_attendances_of_day/get_work_attendances_of_day_cubit.dart';
import 'package:volunteer_work_app/blocs/work_day_attendance/get_work_attendances_of_volunteer/get_work_attendances_of_volunteer_cubit.dart';
import 'package:volunteer_work_app/blocs/work_days/create_work_day/create_work_day_cubit.dart';
import 'package:volunteer_work_app/blocs/work_days/delete_work_day/delete_work_day_cubit.dart';
import 'package:volunteer_work_app/blocs/work_days/update_work_day/update_work_day_cubit.dart';
import 'package:volunteer_work_app/domain/api_client/api_client.dart';

import 'blocs/announcements/get_program_announcements/get_program_announcements_cubit.dart';
import 'blocs/categories/delete_category/delete_category_cubit.dart';
import 'blocs/categories/edit_category/edit_category_cubit.dart';
import 'blocs/categories/get_categories_for_select/get_categories_for_select_cubit.dart';
import 'blocs/conversations/get_conversations/get_conversations_cubit.dart';
import 'blocs/notifications/get_all_notifications/get_all_notifications_cubit.dart';
import 'blocs/organizations/create_organization_account/create_organization_account_cubit.dart';
import 'blocs/organizations/delete_organization/delete_organization_cubit.dart';
import 'blocs/program_photos/create_program_photo/create_program_photo_cubit.dart';
import 'blocs/program_photos/get_photos_of_program/get_photos_of_program_cubit.dart';
import 'blocs/program_tasks/create_task/create_task_cubit.dart';
import 'blocs/program_tasks/delete_task/delete_task_cubit.dart';
import 'blocs/program_tasks/update_task/update_task_cubit.dart';
import 'blocs/skills/create_skill/create_skill_cubit.dart';
import 'blocs/skills/get_skills_for_select/get_skills_for_select_cubit.dart';
import 'blocs/skills/get_skills_list/get_skills_list_cubit.dart';
import 'blocs/student_applications/check_student_applied_to_opportunity/check_student_applied_to_opportunity_cubit.dart';
import 'blocs/student_applications/create_volunteer_application/create_volunteer_application_cubit.dart';
import 'blocs/student_applications/get_home_applications/get_home_applications_cubit.dart';
import 'blocs/students/create_student_account/create_student_account_cubit.dart';
import 'blocs/students/delete_student_account/delete_student_account_cubit.dart';
import 'blocs/students/get_student_by_id/get_student_by_id_cubit.dart';
import 'blocs/task_accomplishes/change_task_accomplish/change_task_accomplish_cubit.dart';
import 'blocs/task_accomplishes/get_accomplishes_of_task/get_accomplishes_of_task_cubit.dart';
import 'blocs/volunteer_opportunities/delete_opportunity/delete_opportunity_cubit.dart';
import 'blocs/volunteer_opportunities/get_organization_opportunities/get_organization_opportunities_cubit.dart';
import 'blocs/volunteer_opportunities/student_view_opportunities/student_view_opportunities_cubit.dart';
import 'blocs/volunteer_programs/create_internal_program/create_internal_program_cubit.dart';
import 'blocs/volunteer_programs/create_program/create_program_cubit.dart';
import 'blocs/volunteer_programs/delete_program/delete_program_cubit.dart';
import 'blocs/volunteer_programs/get_all_internal_programs/get_all_internal_programs_cubit.dart';
import 'blocs/volunteer_programs/get_all_organizations_programs/get_all_organizations_programs_cubit.dart';
import 'blocs/volunteer_programs/update_internal_program/update_internal_program_cubit.dart';
import 'blocs/volunteer_programs/update_program/update_program_cubit.dart';
import 'blocs/volunteer_students/add_volunteer_to_program/add_volunteer_to_program_cubit.dart';
import 'blocs/volunteer_students/get_volunteers_of_program/get_volunteers_of_program_cubit.dart';
import 'blocs/work_days/get_work_days_of_program/get_work_days_of_program_cubit.dart';

class BlocRegistrant extends StatelessWidget {
  const BlocRegistrant({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final ApiClient apiClient = ApiClient();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(apiClient)),
        BlocProvider(
          create: (context) => GetOrganizationsListCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateOrganizationAccountCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateOpportunityCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateOpportunityCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllCategoriesCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetCategoriesForSelectCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateCategoryCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => EditCategoryCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteCategoryCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetOrganizationOpportunitiesCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => StudentViewOpportunitiesCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateVolunteerApplicationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllNotificationsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateSkillCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetSkillsForSelectCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetSkillsListCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateStudentAccountCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllStudentAccountsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteStudentAccountCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteOrganizationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllApplicationsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetApplicationsForOrganizationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetApplicationsForOpportunityCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetApplicationsOfStudentCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ManagementAcceptApplicationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ManagementRejectApplicationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => OrganizationAcceptApplicationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => OrganizationRejectApplicationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetOrganizationProgramsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetTasksOfProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetVolunteerByStudentIdCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetStudentByIdCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateStudentAccountCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateStudentSkillsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateManagementAnnouncementCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateOrganizationAnnouncementCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetManagementAnnouncementsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateInternalProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllInternalProgramsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllOrganizationsProgramsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetConversationsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetConversationMessagesCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateMessageCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteMessageCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetVolunteersOfProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => AddVolunteerToProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetNotVolunteerStudentsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateTaskCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateTaskCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteTaskCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAccomplishesOfTaskCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ChangeTaskAccomplishCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetTaskAccomplishesOfVolunteerCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteTaskAccomplishCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetOrganizationByIdCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetManagementEmployeeByIdCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetVolunteersOfOrganizationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetHomeApplicationsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateWorkDayCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetWorkDaysOfProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteWorkDayCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateWorkDayCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ChangeWorkDayAttendanceCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteWorkDayAttendanceCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetWorkAttendancesOfDayCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetWorkAttendancesOfVolunteerCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ChangeVolunteerGradeCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateProgramPhotoCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetPhotosOfProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteProgramPhotoCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateOrganizationProfileCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CheckStudentAppliedToOpportunityCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateStudentApplicationCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateSkillCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteSkillCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetOrganizationsForHomeCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllVolunteersCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateInternalProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllOpportunitiesCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteAnnouncementCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateManagementAnnouncementCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteVolunteerCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateStudentByManagementCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ManagementResetStudentPasswordCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => UpdateOrganizationAnnouncementCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetOrganizationAnnouncementsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => ResetPasswordCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetProgramAnnouncementsCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteOpportunityCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => DeleteProgramCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => CreateManagementAccountCubit(apiClient),
        ),
        BlocProvider(
          create: (context) => GetAllManagementAccountsCubit(apiClient),
        ),
      ],
      child: child,
    );
  }
}
