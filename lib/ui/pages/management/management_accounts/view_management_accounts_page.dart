import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/management_employees/get_all_management_accounts/get_all_management_accounts_cubit.dart';
import 'package:volunteer_work_app/ui/pages/management/management_accounts/create_management_account_page.dart';

import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';

class ViewManagementAccountsPage extends StatefulWidget {
  const ViewManagementAccountsPage({Key? key}) : super(key: key);

  @override
  State<ViewManagementAccountsPage> createState() =>
      _ViewManagementAccountsPageState();
}

class _ViewManagementAccountsPageState
    extends State<ViewManagementAccountsPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetAllManagementAccountsCubit>(context).state
        is! GetAllManagementAccountsSuccess) {
      BlocProvider.of<GetAllManagementAccountsCubit>(context)
          .getAllManagementAccounts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حسابات الإدارة'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<GetAllManagementAccountsCubit>(context)
                    .getAllManagementAccounts();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocConsumer<GetAllManagementAccountsCubit,
          GetAllManagementAccountsState>(
        listener: (context, state) {
          if (state is GetAllManagementAccountsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllManagementAccountsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllManagementAccountsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetAllManagementAccountsEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetAllManagementAccountsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetAllManagementAccountsCubit>(context)
                    .getAllManagementAccounts();
              },
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final item = state.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: ListTile(
                          leading: Container(
                            child: item.profilePicture == null
                                ? const Icon(
                                    Icons.person,
                                    size: 35,
                                    color: Colors.indigoAccent,
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        '$kDownloadFilesURL/${item.profilePicture?.fileKey ?? ''}',
                                    httpHeaders: {
                                      'Authorization':
                                          'Bearer ${globalAppStorage.getAccessToken()}'
                                    },
                                    imageBuilder: (ctx, image) {
                                      return CircleAvatar(
                                          backgroundImage: image);
                                    },
                                    progressIndicatorBuilder:
                                        (ctx, url, downloadProgress) {
                                      return CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      );
                                    },
                                    errorWidget: (ctx, url, error) {
                                      return const Icon(
                                        Icons.error_outline,
                                        size: 32,
                                      );
                                    },
                                  ),
                          ),
                          title: Flexible(child: Text(item.fullName ?? '-')),
                          isThreeLine: item.email?.isNotEmpty ?? false,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (item.email?.isNotEmpty ?? false)
                                Flexible(child: Text(item.email ?? '-')),
                              Flexible(child: Text(item.userName ?? '-')),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const CreateManagementAccountPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
