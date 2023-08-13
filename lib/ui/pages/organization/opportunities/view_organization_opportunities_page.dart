import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/get_organization_opportunities/get_organization_opportunities_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/centered_progress_indicator.dart';

import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/org_opportunity_item_card.dart';
import 'create_volunteer_opportunity_page.dart';

class ViewOrganizationOpportunitiesPage extends StatefulWidget {
  const ViewOrganizationOpportunitiesPage({Key? key}) : super(key: key);

  @override
  State<ViewOrganizationOpportunitiesPage> createState() =>
      _ViewOrganizationOpportunitiesPageState();
}

class _ViewOrganizationOpportunitiesPageState
    extends State<ViewOrganizationOpportunitiesPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetOrganizationOpportunitiesCubit>(context).state
        is! GetOrganizationOpportunitiesSuccess) {
      BlocProvider.of<GetOrganizationOpportunitiesCubit>(context)
          .getOrganizationOpportunities(globalAppStorage.getOrganizationAccount()?.id ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فرص التطوع المعلنة'),
      ),
      body: BlocConsumer<GetOrganizationOpportunitiesCubit,
          GetOrganizationOpportunitiesState>(
        listener: (context, state) {
          if (state is GetOrganizationOpportunitiesError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetOrganizationOpportunitiesLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetOrganizationOpportunitiesError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetOrganizationOpportunitiesSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetOrganizationOpportunitiesCubit>(context)
                    .getOrganizationOpportunities(globalAppStorage.getOrganizationAccount()?.id ?? 0);
              },
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: OrgOpportunityItemCard(item: state.data[index]),
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
                builder: (_) => const CreateVolunteerOpportunityPage()));
      },
      child: const Icon(Icons.add),),
    );
  }
}
