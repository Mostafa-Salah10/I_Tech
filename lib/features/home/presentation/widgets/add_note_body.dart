import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/core/widgets/show_toast_msg.dart';
import 'package:i_tech/features/home/presentation/manager/create_update/create_update_note_cubit.dart';
import 'package:i_tech/features/home/presentation/manager/home/home_cubit.dart';

// ignore: must_be_immutable
class AddNoteBody extends StatelessWidget {
  new({super.key});
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
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
              if (state is AddNoteFailure) {
                showAppSnackBar(
                  context,
                  text: state.errMsg,
                  backgroundColor: AppColors.errorColor,
                );
              } else if (state is AddNoteSuccess) {
                await context.read<HomeCubit>().getNotes();
                if (!context.mounted) return;
                showAppSnackBar(
                  context,
                  text: "Note Added Successfully",
                  backgroundColor: AppColors.primaryColor,
                );

                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state is AddNoteLoading ? "Loading..." : "Save",
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      state is! AddNoteLoading) {
                    context.read<CreateUpdateNoteCubit>().addNote(
                      title: title,
                      content: description,
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
