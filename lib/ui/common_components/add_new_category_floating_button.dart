import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/categories/get_all_categories/get_all_categories_cubit.dart';
import 'package:volunteer_work_app/utils/form_validators.dart';

import '../../blocs/categories/create_category/create_category_cubit.dart';
import '../../utils/exception_handlers.dart';
import 'add_size.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_progress_indicator.dart';
import 'snack_bars.dart';

class AddNewCategoryFloatingButton extends StatelessWidget {
  const AddNewCategoryFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        final TextEditingController nameTEC = TextEditingController();
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (ctx) {
              return BlocListener<CreateCategoryCubit, CreateCategoryState>(
                listener: (context, state) {
                  if(state is CreateCategorySuccess){
                    formKey.currentState?.reset();
                    nameTEC.clear();

                    BlocProvider.of<GetAllCategoriesCubit>(context)
                        .addItemInternally(state.data);

                    showSuccessSnackBar(
                      context: context,
                      message: 'تم إنشاء تصنيف جديد بنجاح',
                    );
                  }
                  if(state is CreateCategoryError){
                    showNetworkException(context: context, error: state.error);
                  }
                },
                child: Scaffold(
                  appBar: const BottomSheetAppBar(
                    title: 'إنشاء تصنيف جديد',
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
                            validator: fieldRequiredValidator,
                            decoration: const InputDecoration(
                                labelText: 'الاسم',
                                hintText: 'مثال: صحة، تكنولوجيا، تعليم...'),
                          ),
                        ),
                        addVerticalSize(25),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              BlocProvider.of<CreateCategoryCubit>(context)
                                  .createCategory(
                                name: nameTEC.text,
                              );
                            }
                          },
                          child: const Text('إنشاء'),
                        ),
                        BlocBuilder<CreateCategoryCubit, CreateCategoryState>(
                          builder: (context, state) {
                            if (state is CreateCategoryLoading) {
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
