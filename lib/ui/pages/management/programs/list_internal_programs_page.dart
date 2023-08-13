import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/volunteer_programs/get_all_internal_programs/get_all_internal_programs_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/mng_program_item_card.dart';
import 'create_internal_program_page.dart';

class ListInternalProgramsPage extends StatefulWidget {
  const ListInternalProgramsPage({Key? key}) : super(key: key);

  @override
  State<ListInternalProgramsPage> createState() => _ListInternalProgramsPageState();
}

class _ListInternalProgramsPageState extends State<ListInternalProgramsPage> {

  @override
  void initState() {
    super.initState();

    context.read<GetAllInternalProgramsCubit>().getAllInternalPrograms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('البرامج الداخلية (متابعة الإدارة)'),
      ),
      body: BlocConsumer<GetAllInternalProgramsCubit,
          GetAllInternalProgramsState>(
        listener: (context, state) {
          if (state is GetAllInternalProgramsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllInternalProgramsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllInternalProgramsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetAllInternalProgramsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetAllInternalProgramsCubit>(context)
                    .getAllInternalPrograms();
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const CreateInternalProgramPage()));
      },
        child: const Icon(Icons.add),),
    );
  }
}
