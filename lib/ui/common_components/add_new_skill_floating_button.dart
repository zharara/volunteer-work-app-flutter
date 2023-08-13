import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/skills/create_skill/create_skill_cubit.dart';
import '../../blocs/skills/get_skills_list/get_skills_list_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/exception_handlers.dart';
import '../../utils/form_validators.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'select_category_input.dart';
import 'snack_bars.dart';

class AddNewSkillFloatingButton extends StatelessWidget {
  const AddNewSkillFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      final TextEditingController nameTEC = TextEditingController();
      final TextEditingController categoryTEC = TextEditingController();
      CategoryDto? selectedCategory;

      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(12))),
          builder: (ctx) {
            return BlocListener<CreateSkillCubit, CreateSkillState>(
              listener: (context, state) {
                if(state is CreateSkillSuccess){
                  formKey.currentState?.reset();
                  nameTEC.clear();
                  categoryTEC.clear();
                  selectedCategory = null;

                  BlocProvider.of<GetSkillsListCubit>(context)
                      .addItemInternally(state.data);

                  showSuccessSnackBar(
                    context: context,
                    message: 'تم إنشاء مهارة جديدة بنجاح',
                  );
                }
                if(state is CreateSkillError){
                  showNetworkException(context: context, error: state.error);
                }
              },
              child: Scaffold(
                appBar: const BottomSheetAppBar(
                  title: 'إنشاء مهارة جديدة',
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameTEC,
                              validator: fieldRequiredValidator,
                              decoration: const InputDecoration(
                                  labelText: 'الاسم',
                                  hintText:
                                  'مثال: تسويق رقمي، برمجة ويب...'),
                            ),
                            addVerticalSize(20),
                            SelectCategoryInput(
                              textEditingController: categoryTEC,
                              currentlySelected: selectedCategory,
                              onSelect: (CategoryDto? category) {
                                selectedCategory = category;
                              },
                            ),
                          ],
                        ),
                      ),
                      addVerticalSize(25),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ??
                              false) {
                            BlocProvider.of<CreateSkillCubit>(
                                context)
                                .createSkill(
                                CreateSkillDto(
                                    categoryId: selectedCategory?.id,
                                    name: nameTEC.text)
                            );
                          }
                        },
                        child: const Text('إنشاء'),
                      ),
                      BlocBuilder<CreateSkillCubit,
                          CreateSkillState>(
                        builder: (context, state) {
                          if (state is CreateSkillLoading) {
                            return const CenteredProgressIndicator(
                                verticalPadding: 15);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }, child: const Icon(Icons.add),);
  }
}
