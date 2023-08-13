import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/ui/pages/organization/programs/create_volunteer_program_page.dart';

import '../../../../blocs/volunteer_programs/get_organization_programs/get_organization_programs_cubit.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/org_program_item_card.dart';

class ViewOrganizationProgramsPage extends StatefulWidget {
  const ViewOrganizationProgramsPage({Key? key}) : super(key: key);

  @override
  State<ViewOrganizationProgramsPage> createState() => _ViewOrganizationProgramsPageState();
}

class _ViewOrganizationProgramsPageState extends State<ViewOrganizationProgramsPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetOrganizationProgramsCubit>(context).state
    is! GetOrganizationProgramsSuccess) {
      BlocProvider.of<GetOrganizationProgramsCubit>(context)
          .getOrganizationPrograms(organizationId: globalAppStorage.getOrganizationAccount()?.id ?? 0,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برامج المؤسسة'),
      ),
      body: BlocConsumer<GetOrganizationProgramsCubit,
          GetOrganizationProgramsState>(
        listener: (context, state) {
          if (state is GetOrganizationProgramsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetOrganizationProgramsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetOrganizationProgramsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetOrganizationProgramsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetOrganizationProgramsCubit>(context)
                    .getOrganizationPrograms(organizationId: globalAppStorage.getOrganizationAccount()?.id ?? 0);
              },
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: OrgProgramItemCard(item: state.data[index]),
                    );
                  }),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const CreateVolunteerProgramPage()));
      },
        child: const Icon(Icons.add),),
    );
  }
}
