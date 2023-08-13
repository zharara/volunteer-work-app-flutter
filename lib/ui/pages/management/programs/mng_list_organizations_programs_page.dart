import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/volunteer_programs/get_all_organizations_programs/get_all_organizations_programs_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/mng_program_item_card.dart';

class MngListOrganizationsProgramsPage extends StatefulWidget {
  const MngListOrganizationsProgramsPage({Key? key}) : super(key: key);

  @override
  State<MngListOrganizationsProgramsPage> createState() =>
      _MngListOrganizationsProgramsPageState();
}

class _MngListOrganizationsProgramsPageState
    extends State<MngListOrganizationsProgramsPage> {
  @override
  void initState() {
    super.initState();

    context
        .read<GetAllOrganizationsProgramsCubit>()
        .getAllOrganizationsPrograms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برامج المؤسسات'),
      ),
      body: BlocConsumer<GetAllOrganizationsProgramsCubit,
          GetAllOrganizationsProgramsState>(
        listener: (context, state) {
          if (state is GetAllOrganizationsProgramsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllOrganizationsProgramsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllOrganizationsProgramsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetAllOrganizationsProgramsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetAllOrganizationsProgramsCubit>(context)
                    .getAllOrganizationsPrograms();
              },
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: MngProgramItemCard(item: state.data[index]),
                    );
                  }),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
