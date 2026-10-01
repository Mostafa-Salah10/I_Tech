import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_button.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/presentation/manager/home_cubit.dart';
import 'package:i_tech/features/home/presentation/widgets/note_item.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeCubit>();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        child: Column(
          spacing: 23,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textGrey,
                borderRadius: .circular(20),
              ),
            ),

            NoteItem(note: note, withIcon: false),

            const Divider(height: 15, color: AppColors.textGrey, thickness: 1),

            Row(
              children: [
                Icon(Icons.edit_outlined, color: AppColors.textGrey, size: 28),
                const SizedBox(width: 20),
                Text("Edit Note", style: TextStyle(fontSize: 18)),
                const Spacer(),
                Transform.rotate(
                  angle: (22 / 7),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.textGrey,
                    size: 20,
                  ),
                ),
              ],
            ),
            const Divider(height: 15, color: AppColors.textGrey, thickness: 1),

            InkWell(
              onTap: () async {
                if (home.state is DeleteNoteLoading) return;
                await home.deleteNote(noteId: note.id);
                if (!context.mounted) return;
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: AppColors.textGrey,
                    size: 28,
                  ),
                  const SizedBox(width: 20),
                  Text("Delete Note", style: TextStyle(fontSize: 18)),
                  const Spacer(),
                  Transform.rotate(
                    angle: (22 / 7),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.textGrey,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return AppButton(
                  textColor: AppColors.primaryColor,
                  text: state is DeleteNoteLoading ? "Loading...." : "Cancel",
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  onPressed: () {
                    if (state is DeleteNoteLoading) return;
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
