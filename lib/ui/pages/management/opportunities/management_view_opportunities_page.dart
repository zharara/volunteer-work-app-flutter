import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/volunteer_opportunities/get_all_opportunities/get_all_opportunities_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/mng_opportunity_item_card.dart';

class ManagementViewOpportunitiesPage extends StatefulWidget {
  const ManagementViewOpportunitiesPage({Key? key}) : super(key: key);

  @override
  State<ManagementViewOpportunitiesPage> createState() => _ManagementViewOpportunitiesPageState();
}

class _ManagementViewOpportunitiesPageState extends State<ManagementViewOpportunitiesPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetAllOpportunitiesCubit>(context).state
    is! GetAllOpportunitiesSuccess) {
      BlocProvider.of<GetAllOpportunitiesCubit>(context)
          .getAllOpportunities();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فرص التطوع المعلنة'),
      ),
      body: BlocConsumer<GetAllOpportunitiesCubit,
          GetAllOpportunitiesState>(
        listener: (context, state) {
          if (state is GetAllOpportunitiesError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllOpportunitiesLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllOpportunitiesError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetAllOpportunitiesSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetAllOpportunitiesCubit>(context)
                    .getAllOpportunities();
              },
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: MngOpportunityItemCard(item: state.data[index]),
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
