import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/core/widgets/show_toast_msg.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/presentation/manager/create_update/create_update_note_cubit.dart';
import 'package:i_tech/features/home/presentation/manager/home/home_cubit.dart';

class UpdateNoteBody extends StatefulWidget {
  const UpdateNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<UpdateNoteBody> createState() => _UpdateNoteBodyState();
}

class _UpdateNoteBodyState extends State<UpdateNoteBody> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  void initState() {
    title = widget.note.title;
    description = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            initialValue: widget.note.title,
            onChanged: (title) {
              this.title = title;
            },

            validator: (value) {
              return _validateData(value);
            },

            hint: "Title",
            prefixIcon: Icon(
              Icons.description_outlined,
              color: AppColors.blueGreyColor,
            ),
          ),

          const SizedBox(height: 20),
          AppTextFormField(
            initialValue: widget.note.content,

            onChanged: (desc) {
              description = desc;
            },

            validator: (value) {
              return _validateData(value);
            },
            hint: "Description",
            prefixIcon: Icon(Icons.menu_book, color: AppColors.blueGreyColor),
            maxLines: 5,
            minLines: 5,
            maxLength: 300,
          ),

          const Spacer(),

          BlocConsumer<CreateUpdateNoteCubit, CreateUpdateNoteState>(
            listener: (context, state) async {
              if (state is UpdateNoteFailure) {
                showAppSnackBar(
                  context,
                  text: state.errMsg,
                  backgroundColor: AppColors.errorColor,
                );
              } else if (state is UpdateNoteSuccess) {
                await context.read<HomeCubit>().getNotes();
                if (!context.mounted) return;
                showAppSnackBar(
                  context,
                  text: "Note Updated Successfully",
                  backgroundColor: AppColors.primaryColor,
                );

                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state is UpdateNoteLoading ? "Loading..." : "Save",
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      state is! UpdateNoteLoading) {
                    context.read<CreateUpdateNoteCubit>().updateNote(
                      note: NoteModel(
                        id: widget.note.id,
                        title: title,
                        content: description,
                      ),
                    );
                  }
                },
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String? _validateData(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field is required";
    } else {
      return null;
    }
  }
}
