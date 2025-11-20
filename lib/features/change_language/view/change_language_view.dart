import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relaxio/core/theme/app_padding.dart';
import 'package:relaxio/core/widgets/dialog/custom_loding_dialog.dart';
import 'package:relaxio/core/widgets/toast_message/toast_message.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_cubit.dart';
import 'package:relaxio/features/change_language/view_model/change_lang_states.dart';
import 'package:relaxio/generated/l10n.dart';
part '../widget/change_lang_widget.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          S.of(context).changeLanguage,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: AppPadding.allpadding,
        child: BlocListener<ChangeLangCubit, ChangeLangStates>(
          listener: (context, state) {
            _listenerHandler(context, state);
          },
          child: BlocBuilder<ChangeLangCubit, ChangeLangStates>(
            builder: (context, state) {
              final cubit = context.read<ChangeLangCubit>();
              return ChangeLangWidget(
                cubit: cubit,
              );
            },
          ),
        ),
      ),
    );
  }

  void _listenerHandler(BuildContext context, ChangeLangStates state) {
    if (state is ChangeLangLoadingState) {
      const Duration(seconds: 2);
      CustomLoadingDialog.show(context);
    }

    if (state is ChangeLangErrorState) {
      Navigator.pop(context);
      ToastMessage.showErrorMessage(context, state.error);
    } else if (state is ChangeLangSuccessState) {
      Navigator.pop(context);
      ToastMessage.showSuccessMessage(
          context, S.of(context).languageChangedSuccess);
      Navigator.pop(context);
    }
  }
}
