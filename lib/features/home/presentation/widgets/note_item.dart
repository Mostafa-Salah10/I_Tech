import 'package:flutter/material.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/features/home/data/models/note_model.dart';
import 'package:i_tech/features/home/presentation/widgets/note_bottom_sheet.dart';

import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, this.withIcon = true});
  final NoteModel note;
  final bool? withIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 13,
        children: [
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.2),

              borderRadius: .circular(12),
            ),

            child: Icon(
              Icons.wb_incandescent,
              color: AppColors.primaryColor,
              size: 32,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  note.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  note.content,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.date_range,
                      color: AppColors.textGrey,
                      size: 23,
                    ),

                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        formateDate,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          withIcon == true
              ? IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => NoteBottomSheet(note: note),
                    );
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: 30,
                    color: AppColors.textGrey,
                  ),
                )
              : const SizedBox(width: 20),
        ],
      ),
    );
  }

  String get formateDate {
    final date = DateTime.now();
    final formattedDate = DateFormat('MMM dd, yyyy').format(date);

    return formattedDate;
  }
}
