import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/categories/delete_category/delete_category_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/add_new_category_floating_button.dart';
import 'package:volunteer_work_app/ui/common_components/add_size.dart';
import 'package:volunteer_work_app/ui/common_components/dialogs.dart';
import 'package:volunteer_work_app/ui/common_components/snack_bars.dart';

import '../../../../blocs/categories/edit_category/edit_category_cubit.dart';
import '../../../../blocs/categories/get_all_categories/get_all_categories_cubit.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';

class ManageCategoriesPage extends StatefulWidget {
  const ManageCategoriesPage({Key? key}) : super(key: key);

  @override
  State<ManageCategoriesPage> createState() => _ManageCategoriesPageState();
}

class _ManageCategoriesPageState extends State<ManageCategoriesPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllCategoriesCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocListener<EditCategoryCubit, EditCategoryState>(
        listener: (context, state) {
          if (state is EditCategoryError) {
            showNetworkException(context: context, error: state.error);
          }

          if (state is EditCategorySuccess) {
            Navigator.pop(context);

            BlocProvider.of<GetAllCategoriesCubit>(context)
                .updateItemInternally(state.data);
            showSuccessSnackBar(
              context: context,
              message: 'تم تعديل التصنيف بنجاح',
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('إدارة تصنيفات مجالات التطوع'),
          ),
          floatingActionButton: const AddNewCategoryFloatingButton(),
          body:
              BlocConsumer<GetAllCategoriesCubit, GetAllCategoriesState>(
                listener: (context, state) {
                  if (state is GetAllCategoriesError) {
                    showNetworkException(context: context, error: state.error);
                  }
                },
                builder: (context, state) {
                  if (state is GetAllCategoriesLoading) {
                    return  const CenteredProgressIndicator(verticalPadding: 0);
                  }
                  if (state is GetAllCategoriesError) {
                    return const  CenteredErrorMessage(verticalPadding: 0);
                  }
                  if (state is GetAllCategoriesEmpty) {
                    return const CenteredEmptyData();
                  }
                  if (state is GetAllCategoriesSuccess) {
                    return  ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (ctx, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5,0),
                          child: Card(
                            child: ListTile(
                              title: Text(state.data[index].name ?? '-'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  edit(context, state, index),
                                  delete(context, state, index),
                                ],
                              ),
                            ),
                          ),
                        ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),

        ),
      )
    ;
  }
}

Widget edit(BuildContext context, GetAllCategoriesSuccess state, int index) {
  return IconButton(
      onPressed: () {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController nameTEC = TextEditingController();
        nameTEC.text = state.data[index].name ?? '';
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (ctx) {
              return Scaffold(
                appBar: const BottomSheetAppBar(
                  title: 'تعديل التصنيف',
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: TextFormField(
                          controller: nameTEC,
                          decoration: const InputDecoration(
                              labelText: 'الاسم',
                              hintText: 'مثال: صحة، تكنولوجيا، تعليم...'),
                        ),
                      ),
                      addVerticalSize(25),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<EditCategoryCubit>(context)
                                .editCategory(
                              categoryDto: state.data[index],
                              newName: nameTEC.text,
                            );
                          }
                        },
                        child: const Text('حفظ'),
                      ),
                      BlocBuilder<EditCategoryCubit, EditCategoryState>(
                        builder: (context, state) {
                          if (state is EditCategoryLoading) {
                            return const CenteredProgressIndicator(
                                verticalPadding: 15);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      icon: const Icon(Icons.edit, color: Colors.blue,));
}

Widget delete(BuildContext context, GetAllCategoriesSuccess state, int index) {
  return IconButton(
      onPressed: () {
        showDeleteDialog(
          context: context,
          itemName: state.data[index].name ?? '',
          loadingOrDeleteButton:
              BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
            listener: (context, deleteState) {
              if (deleteState is DeleteCategoryError) {
                showNetworkException(
                    context: context, error: deleteState.error);
                context.read<DeleteCategoryCubit>().resetState();
              }

              if (deleteState is DeleteCategorySuccess) {
                Navigator.pop(context);
                BlocProvider.of<GetAllCategoriesCubit>(context)
                    .deleteItemInternally(deleteState.data.id!);
                showSuccessSnackBar(
                  context: context,
                  message: 'تم حذف التصنيف بنجاح',
                );
                context.read<DeleteCategoryCubit>().resetState();
              }
            },
            builder: (context, deleteState) {
              if (deleteState is DeleteCategoryLoading) {
                return const CircularProgressIndicator();
              }

              return deleteButton(() {
                context
                    .read<DeleteCategoryCubit>()
                    .deleteCategory(id: state.data[index].id!);
              });
            },
          ),
        );
      },
      icon: const Icon(
        Icons.delete_forever,
        color: Colors.red,
      ));
}
