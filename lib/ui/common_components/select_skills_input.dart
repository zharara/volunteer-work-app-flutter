import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/skills/get_skills_for_select/get_skills_for_select_cubit.dart';
import '../../domain/api_generated_code/api.models.swagger.dart';
import '../../utils/form_validators.dart';
import 'add_new_skill_floating_button.dart';
import 'bottom_sheet_app_bar.dart';
import 'centered_empty_data.dart';
import 'centered_error_message.dart';
import 'centered_progress_indicator.dart';

class SelectSkillsInput extends StatelessWidget {
  const SelectSkillsInput(
      {Key? key,
      required this.isRequired,
      required this.label,
      required this.textEditingController,
      required this.onSelect,
      this.disabled = false,
      })
      : super(key: key);

  final bool isRequired;
  final String label;
  final TextEditingController textEditingController;
  final void Function(List<ExistingOrCreateNewSkillDto> selectedSkills)
      onSelect;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: disabled ? null : () async {
        if (BlocProvider.of<GetSkillsForSelectCubit>(context).state
            is! GetSkillsForSelectSuccess) {
          BlocProvider.of<GetSkillsForSelectCubit>(context)
              .getSkillsForSelect();
        }

        List<SkillDto> toSelectSkills = List.empty(growable: true);

        final skills = await showModalBottomSheet<List<SkillDto>>(
            context: context,
            builder: (ctx) {
              return StatefulBuilder(
                builder: (ctx, sSetState) => Scaffold(
                  backgroundColor: Colors.white,
                  appBar: BottomSheetAppBar(
                    title: 'اختيار مهارات المتطوع المقترحة',
                    actions: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<GetSkillsForSelectCubit>(context)
                                .getSkillsForSelect();
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BlocConsumer<GetSkillsForSelectCubit,
                            GetSkillsForSelectState>(
                          listener: (context, state) {
                            if (state is GetSkillsForSelectError) {}
                          },
                          builder: (context, state) {
                            if (state is GetSkillsForSelectLoading) {
                              return const CenteredProgressIndicator(
                                  verticalPadding: 0);
                            }
                            if (state is GetSkillsForSelectError) {
                              return const CenteredErrorMessage(
                                  verticalPadding: 0);
                            }
                            if (state is GetSkillsForSelectEmpty) {
                              return const CenteredEmptyData();
                            }
                            if (state is GetSkillsForSelectSuccess) {
                              return ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (ctx, index) {
                                    return CheckboxListTile(
                                      value: toSelectSkills.any(
                                          (e) => e.id == state.data[index].id),
                                      title:
                                          Text(state.data[index].name ?? '-'),
                                      subtitle: Text(state.data[index].category?.name ?? '-'),
                                      onChanged: (selected) {
                                        sSetState(() {
                                          if (selected ?? false) {
                                            toSelectSkills
                                                .add(state.data[index]);
                                          } else {
                                            toSelectSkills.removeWhere((e) =>
                                                e.id == state.data[index].id);
                                          }
                                        });
                                      },
                                    );
                                  });
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: toSelectSkills.isEmpty
                                  ? null
                                  : () {
                                      Navigator.pop(context, toSelectSkills);
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
                    child: AddNewSkillFloatingButton(),
                  ),
                ),
              );
            });

        if (skills?.isNotEmpty ?? false) {
          List<ExistingOrCreateNewSkillDto> selectedSkills =
              List.empty(growable: true);
          textEditingController.clear();

          for (final skill in skills!) {
            textEditingController.text =
                '${textEditingController.text.trim()} ${textEditingController.text.trim().isEmpty ? '' : '-'} ${skill.name}';

            selectedSkills.add(ExistingOrCreateNewSkillDto(id: skill.id));
          }

          onSelect(selectedSkills);

        } else {
          textEditingController.text = '';
          onSelect.call([]);
        }
      },
      controller: textEditingController,
      validator: isRequired ? fieldRequiredValidator : null,
      decoration: InputDecoration(
        labelText: isRequired ? '$label *' : label,
      ),
    );
  }
}
