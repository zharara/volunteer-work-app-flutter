import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_all_applications/get_all_applications_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_for_opportunity/get_applications_for_opportunity_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_for_organization/get_applications_for_organization_cubit.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_home_applications/get_home_applications_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

void onManagementChangeApplicationStatus(
    {required BuildContext context,
    required StudentApplicationDto applicationDto}) {
  context.read<GetHomeApplicationsCubit>().updateItemInternally(applicationDto);
  context.read<GetAllApplicationsCubit>().updateItemInternally(applicationDto);
}

void onOrganizationChangeApplicationStatus(
    {required BuildContext context,
    required StudentApplicationDto applicationDto}) {
  context.read<GetHomeApplicationsCubit>().updateItemInternally(applicationDto);

  context
      .read<GetApplicationsForOpportunityCubit>()
      .updateItemInternally(applicationDto);

  context
      .read<GetApplicationsForOrganizationCubit>()
      .updateItemInternally(applicationDto);
}
