import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_for_organization/get_applications_for_organization_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.enums.swagger.dart';
import 'package:volunteer_work_app/main.dart';
import 'package:volunteer_work_app/ui/common_components/application_status_chip.dart';

import '../../../../blocs/student_applications/organization_accept_application/organization_accept_application_cubit.dart';
import '../../../../blocs/student_applications/organization_reject_application/organization_reject_application_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/org_application_item_card.dart';
import '../../../common_components/snack_bars.dart';
import 'organization_view_application_details_page.dart';

class OrganizationViewAllApplicationsPage extends StatefulWidget {
  const OrganizationViewAllApplicationsPage({Key? key}) : super(key: key);

  @override
  State<OrganizationViewAllApplicationsPage> createState() =>
      _OrganizationViewAllApplicationsPageState();
}

class _OrganizationViewAllApplicationsPageState
    extends State<OrganizationViewAllApplicationsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetApplicationsForOrganizationCubit>(context)
        .getApplicationsForOrganization(
      organizationId: globalAppStorage.getOrganizationAccount()!.id!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلبات التطوع'),
      ),
      body: BlocConsumer<GetApplicationsForOrganizationCubit,
          GetApplicationsForOrganizationState>(
        listener: (context, state) {
          if (state is GetApplicationsForOrganizationError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetApplicationsForOrganizationLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetApplicationsForOrganizationError) {
            return const CenteredErrorMessage(verticalPadding: 0);
          }
          if (state is GetApplicationsForOrganizationEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetApplicationsForOrganizationSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (ctx, index) {
                  final item = state.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: OrgApplicationItemCard(item: item),
                  );
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
