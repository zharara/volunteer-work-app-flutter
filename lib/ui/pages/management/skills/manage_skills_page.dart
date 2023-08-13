import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/skills/get_skills_list/get_skills_list_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/add_new_skill_floating_button.dart';
import 'package:volunteer_work_app/utils/form_validators.dart';

import '../../../../blocs/skills/delete_skill/delete_skill_cubit.dart';
import '../../../../blocs/skills/update_skill/update_skill_cubit.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/dialogs.dart';
import '../../../common_components/select_category_input.dart';
import '../../../common_components/snack_bars.dart';

class ManageSkillsPage extends StatefulWidget {
  const ManageSkillsPage({Key? key}) : super(key: key);

  @override
  State<ManageSkillsPage> createState() => _ManageSkillsPageState();
}

class _ManageSkillsPageState extends State<ManageSkillsPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetSkillsListCubit>(context).getSkillsList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateSkillCubit, UpdateSkillState>(
      listener: (context, state) {
        if (state is UpdateSkillError) {
          showNetworkException(context: context, error: state.error);
        }
        if (state is UpdateSkillSuccess) {
          Navigator.pop(context);

          BlocProvider.of<GetSkillsListCubit>(context)
              .updateItemInternally(state.data);

          showSuccessSnackBar(
            context: context,
            message: 'تم تعديل المهارة بنجاح',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إدارة مهارات المتطوعين'),
        ),
        floatingActionButton: const AddNewSkillFloatingButton(),
        body: BlocConsumer<GetSkillsListCubit, GetSkillsListState>(
          listener: (context, state) {
            if (state is GetSkillsListError) {
              showNetworkException(context: context, error: state.error);
            }
          },
          builder: (context, state) {
            if (state is GetSkillsListLoading) {
              return const CenteredProgressIndicator(verticalPadding: 0);
            }
            if (state is GetSkillsListError) {
              return const CenteredErrorMessage(verticalPadding: 0);
            }
            if (state is GetSkillsListEmpty) {
              return const CenteredEmptyData();
            }
            if (state is GetSkillsListSuccess) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5,0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                final GlobalKey<FormState> formKey =
                                    GlobalKey<FormState>();
                                final TextEditingController nameTEC =
                                    TextEditingController();
                                final TextEditingController categoryTEC =
                                    TextEditingController();
                                CategoryDto? selectedCategory =
                                    state.data[index].category;
                                nameTEC.text = state.data[index].name ?? '';
                                categoryTEC.text =
                                    state.data[index].category?.name ?? '';

                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(12))),
                                    builder: (ctx) {
                                      return Scaffold(
                                        appBar: const BottomSheetAppBar(
                                          title: 'تعديل المهارة',
                                        ),
                                        backgroundColor: Colors.white,
                                        body: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Form(
                                                key: formKey,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: nameTEC,
                                                      validator:
                                                          fieldRequiredValidator,
                                                      decoration:
                                                          const InputDecoration(
                                                              labelText:
                                                                  'الاسم',
                                                              hintText:
                                                                  'مثال: تسويق رقمي، برمجة ويب...'),
                                                    ),
                                                    addVerticalSize(20),
                                                    SelectCategoryInput(
                                                      textEditingController:
                                                          categoryTEC,
                                                      currentlySelected:
                                                          selectedCategory,
                                                      onSelect: (CategoryDto?
                                                          category) {
                                                        selectedCategory =
                                                            category;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              addVerticalSize(25),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (formKey.currentState
                                                          ?.validate() ??
                                                      false) {
                                                    BlocProvider.of<
                                                                UpdateSkillCubit>(
                                                            context)
                                                        .updateSkill(UpdateSkillDto(
                                                            id: state
                                                                    .data[index]
                                                                    .id ??
                                                                0,
                                                            categoryId:
                                                                selectedCategory
                                                                    ?.id,
                                                            name:
                                                                nameTEC.text));
                                                  }
                                                },
                                                child: const Text('تعديل'),
                                              ),
                                              BlocBuilder<UpdateSkillCubit,
                                                  UpdateSkillState>(
                                                builder: (context, state) {
                                                  if (state
                                                      is UpdateSkillLoading) {
                                                    return const CenteredProgressIndicator(
                                                        verticalPadding: 15);
                                                  }
                                                  return const SizedBox
                                                      .shrink();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              )),
                          IconButton(
                              onPressed: () {
                                showDeleteDialog(
                                  context: context,
                                  itemName: state.data[index].name ?? '',
                                  loadingOrDeleteButton: BlocConsumer<
                                      DeleteSkillCubit, DeleteSkillState>(
                                    listener: (context, deleteState) {
                                      if (deleteState is DeleteSkillError) {
                                        showNetworkException(
                                            context: context,
                                            error: deleteState.error);
                                        context
                                            .read<DeleteSkillCubit>()
                                            .resetState();
                                      }

                                      if (deleteState is DeleteSkillSuccess) {
                                        Navigator.pop(context);
                                        BlocProvider.of<GetSkillsListCubit>(
                                                context)
                                            .deleteItemInternally(
                                                deleteState.data.id!);
                                        showSuccessSnackBar(
                                          context: context,
                                          message: 'تم حذف المهارة بنجاح',
                                        );
                                        context
                                            .read<DeleteSkillCubit>()
                                            .resetState();
                                      }
                                    },
                                    builder: (context, deleteState) {
                                      if (deleteState is DeleteSkillLoading) {
                                        return const CircularProgressIndicator();
                                      }

                                      return deleteButton(() {
                                        context
                                            .read<DeleteSkillCubit>()
                                            .deleteSkill(state.data[index].id!);
                                      });
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ))
                        ],
                      ),
                      title: Text(state.data[index].name ?? '-'),
                      subtitle: Text(state.data[index].category?.name ?? '-'),
                    ),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
