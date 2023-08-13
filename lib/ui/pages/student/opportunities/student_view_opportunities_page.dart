import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/volunteer_opportunities/student_view_opportunities/student_view_opportunities_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/opportunity_item_card.dart';

class StudentViewOpportunitiesPage extends StatefulWidget {
  const StudentViewOpportunitiesPage({Key? key}) : super(key: key);

  @override
  State<StudentViewOpportunitiesPage> createState() =>
      _StudentViewOpportunitiesPageState();
}

class _StudentViewOpportunitiesPageState
    extends State<StudentViewOpportunitiesPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<StudentViewOpportunitiesCubit>(context).viewOpportunities();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فرص التطوع'),
      ),
      body: BlocConsumer<StudentViewOpportunitiesCubit,
          StudentViewOpportunitiesState>(
        listener: (context, state) {
          if (state is StudentViewOpportunitiesError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is StudentViewOpportunitiesLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is StudentViewOpportunitiesError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is StudentViewOpportunitiesSuccess) {
            return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: OpportunityItemCard(item: state.data[index],),
                      );

                  }
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
