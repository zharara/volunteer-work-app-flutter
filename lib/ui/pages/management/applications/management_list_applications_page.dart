import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_all_applications/get_all_applications_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/mng_application_item_card.dart';

import '../../../../blocs/student_applications/management_accept_application/management_accept_application_cubit.dart';
import '../../../../blocs/student_applications/management_reject_application/management_reject_application_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.enums.swagger.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/application_status_chip.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/snack_bars.dart';
import 'management_view_application_details_page.dart';

class ManagementListApplicationsPage extends StatefulWidget {
  const ManagementListApplicationsPage({Key? key}) : super(key: key);

  @override
  State<ManagementListApplicationsPage> createState() =>
      _ManagementListApplicationsPageState();
}

class _ManagementListApplicationsPageState
    extends State<ManagementListApplicationsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllApplicationsCubit>(context).getAllApplications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلبات التطوع'),
      ),
      body: BlocConsumer<GetAllApplicationsCubit, GetAllApplicationsState>(
        listener: (context, state) {
          if (state is GetAllApplicationsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllApplicationsLoading) {
            return CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllApplicationsError) {
            return CenteredErrorMessage(verticalPadding: 0);
          }
          if (state is GetAllApplicationsEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetAllApplicationsSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (ctx, index) {
                  final item = state.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: MngApplicationItemCard(item: item),
                  );
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
