import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/organizations/delete_organization/delete_organization_cubit.dart';
import 'package:volunteer_work_app/blocs/organizations/get_organizations_list/get_organizations_list_cubit.dart';

import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/dialogs.dart';
import '../../../common_components/snack_bars.dart';
import 'mng_view_organization_profile_page.dart';

class ManageOrganizationsAccountsPage extends StatefulWidget {
  const ManageOrganizationsAccountsPage({Key? key}) : super(key: key);

  @override
  State<ManageOrganizationsAccountsPage> createState() =>
      _ManageOrganizationsAccountsPageState();
}

class _ManageOrganizationsAccountsPageState
    extends State<ManageOrganizationsAccountsPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetOrganizationsListCubit>(context).state
        is! GetOrganizationsListSuccess) {
      BlocProvider.of<GetOrganizationsListCubit>(context)
          .getOrganizationsList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة المؤسسات'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<GetOrganizationsListCubit>(context)
                    .getOrganizationsList();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocConsumer<GetOrganizationsListCubit, GetOrganizationsListState>(
        listener: (context, state) {
          if (state is GetOrganizationsListError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetOrganizationsListLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetOrganizationsListError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetOrganizationsListEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetOrganizationsListSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetOrganizationsListCubit>(context)
                    .getOrganizationsList();
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
                                    Icons.account_balance,
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
                          title: Text(item.fullName ?? '-'),
                          isThreeLine: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(item.fieldOfWork ?? '-'),
                              Text(item.userName ?? '-'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDeleteDialog(
                                        context: context,
                                        title: 'حذف حساب مؤسسة',
                                        itemName: item.fullName ?? '-',
                                        moreInfo:
                                            'سيتم حذف حساب المؤسسة وما يتعلق بها من نظام التطوع بشكل كامل.',
                                        loadingOrDeleteButton: BlocConsumer<
                                                DeleteOrganizationCubit,
                                                DeleteOrganizationState>(
                                            listener: (context, state) {
                                          if (state
                                              is DeleteOrganizationError) {
                                            showNetworkException(
                                                context: context,
                                                error: state.error);
                                          }

                                          if (state
                                              is DeleteOrganizationSuccess) {
                                            context
                                                .read<
                                                    GetOrganizationsListCubit>()
                                                .deleteItemInternally(item.id!);

                                            context
                                                .read<DeleteOrganizationCubit>()
                                                .resetState();

                                            showSuccessSnackBar(
                                              context: context,
                                              message:
                                                  'تم حذف حساب المؤسسة بنجاح',
                                            );
                                            Navigator.pop(context);
                                          }
                                        }, builder: (context, state) {
                                          if (state
                                              is DeleteOrganizationLoading) {
                                            return Transform.scale(
                                                scale: 0.7,
                                                child:
                                                    const CircularProgressIndicator());
                                          }

                                          return deleteButton(() {
                                            context
                                                .read<DeleteOrganizationCubit>()
                                                .deleteOrganization(
                                                    item.id ?? 0);
                                          });
                                        }));
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            MngViewOrganizationProfilePage(
                                                organization: item),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward)),
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
    );
  }
}
