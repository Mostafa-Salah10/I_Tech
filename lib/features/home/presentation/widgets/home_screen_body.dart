import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_tech/core/themes/app_colors.dart';
import 'package:i_tech/core/widgets/app_text_form_field.dart';
import 'package:i_tech/features/home/presentation/manager/home_cubit.dart';
import 'package:i_tech/features/home/presentation/widgets/note_item.dart';

class HomeScreenBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 25,
          children: [
            AppTextFormField(
              hint: "Search notes...",
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: AppColors.greyColor,
              ),
            ),

            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is GetNotesLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state is GetNotesFailure) {
                    return Center(
                      child: Text(
                        "Something went Wrong",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.errorColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else if (state is GetNotsSuccess) {
                    return ListView.separated(
                      itemCount: state.notes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (context, index) =>
                          NoteItem(note: state.notes.elementAt(index)),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
