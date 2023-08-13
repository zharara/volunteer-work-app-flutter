import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/announcements/get_program_announcements/get_program_announcements_cubit.dart';

import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';

class StudentProgramAnnouncementsPage extends StatefulWidget {
  const StudentProgramAnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<StudentProgramAnnouncementsPage> createState() => _StudentProgramAnnouncementsPageState();
}

class _StudentProgramAnnouncementsPageState extends State<StudentProgramAnnouncementsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetProgramAnnouncementsCubit>(context).getProgramAnnouncements(volunteerProgramId: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إعلانات البرنامج الملتحق به'),
      ),
      body: BlocConsumer<GetProgramAnnouncementsCubit,
          GetProgramAnnouncementsState>(
        listener: (context, state) {
          if (state is GetProgramAnnouncementsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetProgramAnnouncementsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetProgramAnnouncementsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetProgramAnnouncementsSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return
                    Container();

                }
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }


}
