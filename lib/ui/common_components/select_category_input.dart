import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/categories/get_categories_for_select/get_categories_for_select_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/form_validators.dart';
import 'add_new_category_floating_button.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_empty_data.dart';
import 'centered_error_message.dart';
import 'centered_progress_indicator.dart';

class SelectCategoryInput extends StatelessWidget {
  const SelectCategoryInput({
    Key? key,
    this.isRequired = true,
    required this.onSelect,
    required this.currentlySelected,
    required this.textEditingController,
  }) : super(key: key);

  final bool isRequired;
  final TextEditingController textEditingController;
  final CategoryDto? currentlySelected;
  final void Function(CategoryDto? selectedCategory) onSelect;

  @override
  Widget build(BuildContext context) {
    CategoryDto? selectedCategory = currentlySelected;

    return TextFormField(
      readOnly: true,
      onTap: () {
        if (BlocProvider.of<GetCategoriesForSelectCubit>(context).state
            is! GetCategoriesForSelectSuccess) {
          BlocProvider.of<GetCategoriesForSelectCubit>(context).getCategories();
        }

        showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return StatefulBuilder(
                builder: (ctx, sSetState) => Scaffold(
                  backgroundColor: Colors.white,
                  appBar: BottomSheetAppBar(
                    title: 'اختيار تصنيف',
                    actions: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<GetCategoriesForSelectCubit>(
                                    context)
                                .getCategories();
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BlocConsumer<GetCategoriesForSelectCubit,
                            GetCategoriesForSelectState>(
                          listener: (context, state) {
                            if (state is GetCategoriesForSelectError) {}
                          },
                          builder: (context, state) {
                            if (state is GetCategoriesForSelectLoading) {
                              return const CenteredProgressIndicator(
                                  verticalPadding: 0);
                            }
                            if (state is GetCategoriesForSelectError) {
                              return const CenteredErrorMessage(
                                  verticalPadding: 0);
                            }
                            if (state is GetCategoriesForSelectEmpty) {
                              return const CenteredEmptyData();
                            }
                            if (state is GetCategoriesForSelectSuccess) {
                              return ListView.builder(
                                itemCount: state.data.length,
                                itemBuilder: (ctx, index) =>
                                    RadioListTile<CategoryDto>(
                                  value: state.data[index],
                                  title: Text(state.data[index].name ?? '-'),
                                  groupValue: selectedCategory,
                                  onChanged: (selected) {
                                    sSetState(() {
                                      selectedCategory = selected;
                                    });
                                  },
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: selectedCategory == null
                                  ? null
                                  : () {
                                      textEditingController.text =
                                          selectedCategory?.name ?? '';

                                      onSelect(selectedCategory);

                                      Navigator.pop(context);
                                    },
                              child: const Text('اختيار')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'رجوع',
                                style: TextStyle(color: Colors.red),
                              )),
                        ],
                      ),
                    ],
                  ),
                  floatingActionButton: const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: AddNewCategoryFloatingButton(),
                  ),
                ),
              );
            });
      },
      controller: textEditingController,
      validator: isRequired ? fieldRequiredValidator : null,
      decoration: InputDecoration(
        labelText: isRequired ? 'تصنيف المجال *' : 'تصنيف المجال',
      ),
    );
  }
}
