import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/students/delete_student_account/delete_student_account_cubit.dart';
import 'package:volunteer_work_app/blocs/students/get_all_students_accounts/get_all_student_accounts_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/centered_empty_data.dart';
import 'package:volunteer_work_app/ui/pages/management/students/mng_reset_student_password_page.dart';

import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/dialogs.dart';
import '../../../common_components/snack_bars.dart';
import '../../common_pages/view_student_profile_page.dart';
import '../students/mng_edit_student_account_page.dart';
import 'create_student_account_page.dart';

class ManageStudentsAccountsPage extends StatefulWidget {
  const ManageStudentsAccountsPage({Key? key}) : super(key: key);

  @override
  State<ManageStudentsAccountsPage> createState() =>
      _ManageStudentsAccountsPageState();
}

class _ManageStudentsAccountsPageState
    extends State<ManageStudentsAccountsPage> {
  @override
  void initState() {
    super.initState();

    if (BlocProvider.of<GetAllStudentAccountsCubit>(context).state
        is! GetAllStudentAccountsSuccess) {
      BlocProvider.of<GetAllStudentAccountsCubit>(context)
          .getAllStudentAccounts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة حسابات الطلبة'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<GetAllStudentAccountsCubit>(context)
                    .getAllStudentAccounts();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body:
          BlocConsumer<GetAllStudentAccountsCubit, GetAllStudentAccountsState>(
        listener: (context, state) {
          if (state is GetAllStudentAccountsError) {
            showNetworkException(context: context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is GetAllStudentAccountsLoading) {
            return const CenteredProgressIndicator(verticalPadding: 0);
          }
          if (state is GetAllStudentAccountsError) {
            return const CenteredErrorMessage(
              verticalPadding: 0,
            );
          }
          if (state is GetAllStudentAccountsEmpty) {
            return const CenteredEmptyData();
          }
          if (state is GetAllStudentAccountsSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetAllStudentAccountsCubit>(context)
                    .getAllStudentAccounts();
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
                          title: Text(item.fullName ?? '-'),
                          isThreeLine: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                  child:
                                      Text(item.universityIdNumber.toString())),
                              Flexible(child: Text(item.userName ?? '-')),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PopupMenuButton<int>(
                                  onSelected: (index) {
                                    if (index == 1) {
                                      showDeleteDialog(
                                          context: context,
                                          title: 'حذف حساب طالب',
                                          itemName: item.fullName ?? '-',
                                          moreInfo:
                                              'سيتم حذف حساب الطالب وما يتعلق به من نظام التطوع بشكل كامل.',
                                          loadingOrDeleteButton: BlocConsumer<
                                                  DeleteStudentAccountCubit,
                                                  DeleteStudentAccountState>(
                                              listener: (context, state) {
                                            if (state
                                                is DeleteStudentAccountError) {
                                              showNetworkException(
                                                  context: context,
                                                  error: state.error);
                                            }

                                            if (state
                                                is DeleteStudentAccountSuccess) {
                                              context
                                                  .read<
                                                      GetAllStudentAccountsCubit>()
                                                  .deleteItemInternally(
                                                      item.id!);

                                              context
                                                  .read<
                                                      DeleteStudentAccountCubit>()
                                                  .resetState();

                                              showSuccessSnackBar(
                                                context: context,
                                                message:
                                                    'تم حذف حساب الطالب بنجاح',
                                              );
                                              Navigator.pop(context);
                                            }
                                          }, builder: (context, state) {
                                            if (state
                                                is DeleteStudentAccountLoading) {
                                              return Transform.scale(
                                                  scale: 0.7,
                                                  child:
                                                      const CircularProgressIndicator());
                                            }

                                            return deleteButton(() {
                                              context
                                                  .read<
                                                      DeleteStudentAccountCubit>()
                                                  .deleteAccount(item.id ?? 0);
                                            });
                                          }));
                                    }

                                    if (index == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              MngEditStudentAccountPage(
                                                  studentDto: item),
                                        ),
                                      );
                                    }
                                    if (index == 3) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              MngResetStudentPasswordPage(
                                                  studentDto: item),
                                        ),
                                      );
                                    }
                                  },
                                  itemBuilder: (ctx) => [
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.delete_forever,
                                                color: Colors.red,
                                              ),
                                              addHorizontalSize(8),
                                              const Text('حذف')
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.edit,
                                                color: Colors.blue,
                                              ),
                                              addHorizontalSize(8),
                                              const Text('تعديل')
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 3,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.lock,
                                                color: Colors.blueGrey,
                                              ),
                                              addHorizontalSize(8),
                                              const Text('تغيير كلمة المرور')
                                            ],
                                          ),
                                        ),
                                      ]),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            ViewStudentProfilePage(
                                                studentDto: item),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const CreateStudentAccountPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
